import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'dart:typed_data' if (dart.library.html) 'dart:html' as typed_data show Uint8List;

import '../base/base_common.dart';
import '../base/base_link.dart';
import '../models/user.dart';
import '../resources/util_common.dart';

class HttpUserRequest extends GetxService{
  //API login Url
  final String loginUrl =
      "https://ridemate-backend-251698569010.asia-east1.run.app/api/user/login";

  //User state
  final _isLoggedIn = false.obs;
  bool get isLoggedIn => _isLoggedIn.value;

  //User data
  Map<String, dynamic>? _userData;
  Map<String, dynamic>? get userData => _userData; // Getter for _userData

  Future<void> logout() async {
    final String? token = await _getStoredToken(); // Get stored token

        // Successful logout, now only clear local token
        _isLoggedIn.value = false;
        BaseCommon.instance.removeToken(); // Clear stored token
        // notifyListeners();
        // Handle logout error
        print('After logout: $_isLoggedIn');//User state after
  }

  Future<void> logoutAll() async{
    final String? token = await _getStoredToken(); // Get stored token
    final response = await http.delete(
      Uri.parse('https://ridemate-backend-251698569010.asia-east1.run.app/api/user/invalidate-me'),
      headers: {'Authorization': 'Bearer $token'},
    );
    if(response.statusCode == 200){
      // Successful logout from all device
      _isLoggedIn.value = false;
      BaseCommon.instance.removeToken(); // Clear stored token
    }else{
      throw Exception('Logout error: ${response.statusCode}');
    }
    // Handle logout error
    print('After logout: $_isLoggedIn');//User state after
  }

  //Send verification code
  Future<void> sendVerificationCode(String phoneNumber) async {
    final response = await http.post(
      Uri.parse(
          'https://ridemate-backend-251698569010.asia-east1.run.app/api/user/send-verification/$phoneNumber'), // Replace with your actual API endpoint
    );

    if (response.statusCode != 200) {
      throw Exception(
          'Failed to send verification code: ${response.statusCode}');
    }
  }

  //Register user
  Future<Map<String, dynamic>> registerUser(
      String code, Map<String, dynamic>? userData) async {
    print(userData);
    if (userData == null) {
      throw Exception('User data is missing.');
    }
    final response = await http.put(
      Uri.parse(
          'https://ridemate-backend-251698569010.asia-east1.run.app/api/user/register/$code'), // Replace with your actual API endpoint
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      print(
          "Register successful: ${response.body}"); // Print response body for debugging
      return data;
    } else {
      print("Register failed: ${response.body}");
      throw Exception('Failed to register user: ${response.statusCode}');
    }
  }

  Future<Data> whoAmI() async {
    final String? token = await _getStoredToken(); // Get stored token

    if (token != null) {
      final response = await http.get(
        Uri.parse(
            'https://ridemate-backend-251698569010.asia-east1.run.app/api/user/me'),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        final user = UserDataResponse.fromJson(jsonDecode(response.body));
        print(user.data);
        return user.data;
      } else {
        throw Exception(
            'Failed to get user information: ${response.statusCode}');
      }
    } else {
      throw Exception('Token not found');
    }
  }

  Future<bool> updateUsername(String newUsername) async {
    final String? token = await _getStoredToken(); // Get stored token

    final url = Uri.parse(
        'https://ridemate-backend-251698569010.asia-east1.run.app/api/user/update/username');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final body = jsonEncode({'userName': newUsername});

    final response = await http.patch(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      // Success: Handle the response, e.g., update local data
      final jsonResponse = jsonDecode(response.body);
      print(newUsername);
      print('Username updated successfully');
      return true;
    } else {
      // Error: Handle the error, e.g., display an error message
      print(newUsername);
      print('Failed to update user information: ${response.body}');
      return false;
    }
  }

  Future<void> updateProfilePicture(typed_data.Uint8List imageBytes) async {
    final String? token = await _getStoredToken(); // Get stored token

    final url = Uri.parse(
        'https://ridemate-backend-251698569010.asia-east1.run.app/api/user/update/profile-picture'); // Correct API endpoint
    final headers = {
      'Authorization': 'Bearer $token',
    };

    var request = http.MultipartRequest('PATCH', url); // Use MultipartRequest
    request.headers.addAll(headers);

    request.files.add(http.MultipartFile.fromBytes(
      'profilePicture', // Field name for the image
      imageBytes,
      filename: 'profile_picture.jpg', // Optional filename
      contentType: MediaType('image', 'jpeg'), // Optional content type
    ));

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Profile picture updated successfully');
      return;
    } else {
      print('Failed to update profile picture');
      print(
          'Error response: ${await response.stream.bytesToString()}'); // Print the error response body
      throw Exception(
          'Failed to update profile picture: ${await response.stream.bytesToString()}'); // Or handle the error differently
    }
  }

  //Get stored token
  Future<String?> _getStoredToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken'); // Retrieve token with key 'token'
  }

  Future<String?> getStoredToken() async {
    // Create a public wrapper method
    return await _getStoredToken();
  }

  //Clear stored token
  // Future<void> _clearStoredToken() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('token'); // Remove token with key 'user_token'
  // }

  //Check if token already exist
  Future<void> checkForStoredToken() async {
    final String? storedToken = await _getStoredToken();
    if (storedToken != null) {
      _isLoggedIn.value = true; // Set login state to true
      // notifyListeners(); // Notify listeners of state change
    }
  }

  @override
  void onInit() {
    super.onInit();
    checkForStoredToken();
  }
}
