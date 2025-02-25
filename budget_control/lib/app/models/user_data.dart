import 'user.dart';
import 'package:get/get.dart';

final userInfo = Data(
  name: '',
  phoneNumber: '',
  trustPoints: 0,
  rating: 0,
  profilePicture: null,
  createdDate: DateTime.now(),
  userRoles: [],
  vehicles: [],
).obs;