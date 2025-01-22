import 'package:e_commerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewmodel extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void onLoginPressed() {
    if (formKey.currentState!.validate()) {
      Get.offAllNamed(routeHome);
    }
  }

  void onRegisterPressed() {
    Get.toNamed(routeSignUp);
  }
}
