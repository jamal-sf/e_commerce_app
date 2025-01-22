import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/ui/screens/login/login_viewmodel.dart';
import 'package:e_commerce/ui/screens/login/widgets/login_with_social.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:e_commerce/ui/styles/decorations.dart';
import 'package:e_commerce/ui/styles/text.dart';
import 'package:e_commerce/ui/widgets/buttons.dart';
import 'package:e_commerce/ui/widgets/text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginViewmodel viewmodel = Get.put(LoginViewmodel());

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: generalPadding,
            decoration: cardDecoration(
              withShadow: true,
              color: AppColors.background,
            ),
            padding: generalPadding,
            child: Form(
              key: viewmodel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Login',
                    style: tStyles['black24semi'],
                  ),
                  generalBox,
                  Text(
                    'Email',
                    style: tStyles['black16'],
                  ),
                  generalSmallBox,
                  CustomTextInput(
                    hint: 'Email',
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
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                  generalBox,
                  generalSmallBox,
                  FullWidthButton(
                    text: 'Login',
                    withMargin: false,
                    onPress: viewmodel.onLoginPressed,
                  ),
                  generalBox,
                  // ** OR LOGIN WITH ****
                  _buildDividerWithText('Or Login With'),
                  generalBox,
                  const LoginWithSocialWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: buidlDontHaveAccountRegister(viewmodel),
    );
  }

  Widget _buildDividerWithText(String text) {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Divider(color: AppColors.grey_10),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(text, style: tStyles['grey14']),
        ),
        const Expanded(
          child: Divider(color: AppColors.grey_10),
        ),
      ],
    );
  }

  Widget buidlDontHaveAccountRegister(LoginViewmodel viewmodel) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Don\'t have an account?',
          ),
          CupertinoButton(
            onPressed: viewmodel.onRegisterPressed,
            padding: EdgeInsets.symmetric(horizontal: horizontalSpacing / 3),
            minSize: 0,
            child: Text(
              'Register',
              style: tStyles['primary14semi'],
            ),
          )
        ],
      ),
    );
  }
}
