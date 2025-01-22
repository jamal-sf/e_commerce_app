import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/ui/screens/sign_up/sign_up_viewmodel.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:e_commerce/ui/styles/decorations.dart';
import 'package:e_commerce/ui/styles/text.dart';
import 'package:e_commerce/ui/widgets/buttons.dart';
import 'package:e_commerce/ui/widgets/text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpScreenViewmodel viewmodel = Get.put(SignUpScreenViewmodel());

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: cardDecoration(
              withShadow: true,
              color: AppColors.background,
            ),
            padding: generalPadding,
            margin: generalPadding,
            child: Form(
              key: viewmodel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        minSize: 0,
                        color: AppColors.primary,
                        child: const Icon(CupertinoIcons.back),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      generalSmallBox,
                      Text(
                        'Sing Up',
                        style: tStyles['black24semi'],
                      ),
                    ],
                  ),
                  generalBox,
                  Text(
                    'Email',
                    style: tStyles['black16'],
                  ),
                  generalSmallBox,
                  CustomTextInput(
                    hint: 'Email',
                    textInputType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.isEmail) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  generalBox,
                  Text(
                    'Password',
                    style: tStyles['black16'],
                  ),
                  generalSmallBox,
                  CustomTextInput(
                    hint: 'Password',
                    textEditingController: viewmodel.passowrdController,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  generalBox,
                  Text(
                    'Confirm Password',
                    style: tStyles['black16'],
                  ),
                  generalSmallBox,
                  CustomTextInput(
                    hint: 'Confirm Password',
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != viewmodel.passowrdController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  generalBox,
                  generalSmallBox,
                  FullWidthButton(
                    text: 'Sign Up',
                    withMargin: false,
                    onPress: viewmodel.onSingupPressed,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
