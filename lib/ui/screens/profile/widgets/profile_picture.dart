import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:e_commerce/ui/styles/decorations.dart';
import 'package:flutter/cupertino.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: circleDecoration(color: AppColors.primary),
        padding: generalPadding,
        child: const Icon(
          CupertinoIcons.person,
          size: 80,
          color: AppColors.white,
        ),
      ),
    );
  }
}
