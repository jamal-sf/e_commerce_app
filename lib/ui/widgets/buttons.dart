import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:e_commerce/ui/styles/decorations.dart';
import 'package:e_commerce/ui/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullWidthButton extends StatelessWidget {
  const FullWidthButton({
    super.key,
    required this.text,
    this.onPress,
    this.withMargin = true,
    this.textColor,
    this.color,
  });
  final String text;
  final void Function()? onPress;
  final bool withMargin;
  final Color? color;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: withMargin ? horizontalSpacing : 0,
      ),
      child: CupertinoButton(
        onPressed: onPress,
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(
          kDeviceWidth,
        ),
        child: AnimatedContainer(
          duration: generalDuration,
          curve: Curves.easeIn,
          height: fullWidthButtonHeight,
          decoration: cardDecoration(
            borderRadius: BorderRadius.circular(
              kDeviceWidth,
            ),
            color: onPress == null
                ? AppColors.black.withOpacity(0.1)
                : color ?? AppColors.primary,
          ),
          //color: AppColors.primary,
          child: Center(
            child: Text(
              text,
              style: tStyles['white16bold']!.copyWith(
                  color: onPress == null
                      ? AppColors.textColor.withOpacity(0.4)
                      : textColor),
            ),
          ),
        ),
      ),
    );
  }
}

class CButton extends StatelessWidget {
  const CButton({
    super.key,
    required this.text,
    this.onPress,
    this.color,
    this.icon,
  });
  final String text;
  final void Function()? onPress;

  final Color? color;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPress,
      padding: EdgeInsets.symmetric(
        vertical: verticalSpacing * 0.8,
        horizontal: horizontalSpacing,
      ),
      borderRadius: BorderRadius.circular(
        kDeviceWidth,
      ),
      color: color ?? AppColors.primary,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon ?? const SizedBox(),
          icon != null ? generalSmallBox : const SizedBox(),
          Text(
            text,
            style: tStyles['white16bold'],
          ),
        ],
      ),
    );
  }
}

class CiconButton extends StatelessWidget {
  const CiconButton({
    super.key,
    required this.text,
    required this.icon,
    this.onPress,
  });
  final String text;
  final IconData icon;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardDecoration(
        color: Colors.white.withOpacity(0.04),
      ),
      padding: generalPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon),
          Text(
            text,
            style: tStyles['black16bold'],
          ),
          Visibility(
            visible: false,
            child: Icon(icon),
          ),
        ],
      ),
    );
  }
}
