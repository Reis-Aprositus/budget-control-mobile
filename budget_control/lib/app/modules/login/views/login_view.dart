import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../base/base_view.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/form_field_widget.dart';
import '../../../resources/responsive_utils.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends BaseView<LoginController> {
  const LoginView({super.key});
  @override
  Widget buildView(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Container(
              color: ColorsManager.loginBackground,
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Budget Control'.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height * 0.03)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                      width: double.infinity,
                      // height: size.height * 0.5,
                      padding: EdgeInsets.all(size.height * 0.02),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0), // Add margin here
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: size.height * 0.02),
                            Text(
                                LocaleKeys.login_label_phone.tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange.shade900,
                                    fontSize: MediaQuery.of(context).size.height * 0.02)),
                            SizedBox(height: size.height * 0.02),
                            Obx(() => FormFieldWidget(
                              padding: 20,
                              controllerEditing: controller.phoneNumberInputController,
                              errorText: controller.phoneError.value,
                              focusColor: Colors.amber,
                              setValueFunc: (value) {
                                // controller.validationEmail();
                              },
                              borderColor: Colors.amber,
                              radiusBorder: 15,
                            )),
                            SizedBox(height: size.height * 0.02),
                            Text(LocaleKeys.login_label_password.tr,
                                style: TextStyle(
                                    color: Colors.orange.shade900,
                                    fontWeight: FontWeight.bold,
                                    fontSize: MediaQuery.of(context).size.height * 0.02)),
                            SizedBox(height: size.height * 0.02),
                            Obx(() => FormFieldWidget(
                              focusColor: Colors.amber,
                              errorText: controller.passwordError.value,
                              controllerEditing: controller.passwordInputController,
                              padding: 20,
                              setValueFunc: (value) {
                                // controller.validationPassword();
                              },
                              borderColor: Colors.amber,
                              isObscureText: !controller.passwordVisible.value,
                              radiusBorder: 15,
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    controller.passwordVisible.value =
                                    !controller.passwordVisible.value;
                                  },
                                  child: Icon(controller.passwordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                            )),
                            SizedBox(height: size.height * 0.04),
                            //
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute widgets evenly
                              children: [
                                GestureDetector( // Forgot account?
                                  onTap: (){

                                  },
                                  child:  Text(
                                    LocaleKeys.login_label_forgot.tr,
                                    style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange,
                                        fontSize: 12
                                    ),
                                  ),
                                ),
                                GestureDetector( // You don't have an account?
                                  onTap: () async {
                                    Get.toNamed(Routes.REGISTER);
                                  },
                                  child:  Text(
                                    LocaleKeys.login_button_register.tr,
                                    style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange,
                                        fontSize: 12
                                    ),
                                  ),
                                ),
                              ],
                            ),
//
                            SizedBoxConst.size(context: context),
                            ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: context.width),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  backgroundColor:
                                  WidgetStateProperty.all(Colors.orange),
                                  padding: WidgetStateProperty.all(const EdgeInsets.all(14)),
                                ),
                                child: Obx(() => controller.isLoading.value
                                    ? const CupertinoActivityIndicator(
                                  color: Colors.white,
                                )
                                    : Text(LocaleKeys.login_button_login.tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: MediaQuery.of(context).size.height *
                                            0.02))),
                                onPressed: () async {
                                  await controller.login();
                                },
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            SizedBox(height: size.height * 0.05),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }

}
