import '../base/api_service.dart';
import '../base/base_link.dart';
import '../models/user_session.dart';

class AuthService extends ApiService {
  Future<bool> changePasswordNoToken() async {
    return true;
  }

  Future<bool> changePassword() async {
    return true;
  }

}
