import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreenViewmodel extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController passowrdController = TextEditingController();

  void onSingupPressed() {
    formKey.currentState!.validate();
  }
}
