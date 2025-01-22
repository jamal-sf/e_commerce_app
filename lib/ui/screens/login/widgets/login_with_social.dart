import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/ui/styles/decorations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginWithSocialWidget extends StatelessWidget {
  const LoginWithSocialWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: kDeviceWidth * 0.24,
          decoration: cardDecoration(),
          padding: generalPadding,
          child: const Icon(FontAwesomeIcons.facebookF),
        ),
        Container(
          width: kDeviceWidth * 0.24,
          decoration: cardDecoration(),
          padding: generalPadding,
          child: const Icon(FontAwesomeIcons.google),
        ),
        Container(
          width: kDeviceWidth * 0.24,
          decoration: cardDecoration(),
          padding: generalPadding,
          child: const Icon(FontAwesomeIcons.apple),
        ),
      ],
    );
  }
}
