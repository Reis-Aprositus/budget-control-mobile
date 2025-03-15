import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../generated/locales.g.dart';
import '../../../base/base_controller.dart';
import '../../../resources/util_common.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth.dart';
import '../../../services/user_service.dart';

class LoginController extends BaseController {
  final TextEditingController phoneNumberInputController =
  TextEditingController();
  final TextEditingController passwordInputController = TextEditingController();
  final passwordVisible = false.obs;

  // late final String fcmToken = Get.find<String>();

  String? tokenFCM = '';

  final passwordError = ''.obs;
  final phoneError = ''.obs;
  AuthService service = AuthService();
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    print('Current language code: ${Get.locale?.languageCode}');
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void navigateToRegister() {
    Get.toNamed(Routes.REGISTER);
  }

  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  bool validate(){
    if (phoneNumberInputController.text.isEmpty ||
        passwordInputController.text.isEmpty) {
      print(LocaleKeys.login_message_field_empty.tr);
      UtilCommon.snackBar(text: LocaleKeys.login_message_field_empty.tr, isFail: true);
      return false;
    }

    if (!RegExp(r'^(password|(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,})$').hasMatch(passwordInputController.text)) {
      UtilCommon.snackBar(text: LocaleKeys.login_message_password_error_invalid.tr, isFail: true);
      return false;
    }

    if (!RegExp(r'^((\+84|84|0)?((3[2-9]|5[25689]|7[0|6-9]|8[0-9]|9[0-4|6-9]|2[0-9])|(12[0-9]|16[2-9]|18[68]|199)))([0-9]{7})$'
    ).hasMatch(phoneNumberInputController.text)) {
      // Update error message for phone number
      UtilCommon.snackBar(text: LocaleKeys.login_message_phone_error.tr, isFail: true);
      return false;
    }

    return true;
  }

  Future<void> login() async {

    if(validate()){
      isLockButton(true);
      print(tokenFCM);
      /*
      service.login(payload).then((token) {
        BaseCommon.instance.saveToken(token).then((_) {
        });
      }).catchError(handleError);

       */
      isLockButton(false);
    }
  }
}
