import 'package:flutter/material.dart';
import 'package:get/get.dart';

const bool kDebugMode = true;
final flutterView = View.of(Get.context!);
double pixelRatio = flutterView.devicePixelRatio;

/// Size in physical pixels
Size physicalScreenSize = flutterView.physicalSize;
double physicalWidth = physicalScreenSize.width;
double physicalHeight = physicalScreenSize.height;

/// Size in logical pixels
Size logicalScreenSize = flutterView.physicalSize / pixelRatio;
final double screenRatio = (logicalScreenSize.height / logicalScreenSize.width);
// ignore: avoid_bool_literals_in_conditional_expressions
bool isThereSystemNav = screenRatio < 19.1 / 9 ? true : false;
double _heightToBeAdded() {
  if (screenRatio >= 2.16) {
    return 0;
  } else {
    final double newSize = 2.16 * kDeviceWidth;
    return newSize - logicalScreenSize.height;
  }
}

///  ignore: duplicate_ignore
double kDeviceWidth = logicalScreenSize.width;
double kActualDeviceHeight = logicalScreenSize.height;
double kDeviceHeight = (isThereSystemNav)
    ? logicalScreenSize.height + _heightToBeAdded()
    : logicalScreenSize.height;

// General Spacing

final double horizontalSpacing = kDeviceWidth * 0.05;
final double verticalSpacing = kDeviceHeight * 0.02;

// Widgets Measures

final double fullWidthButtonHeight = kDeviceHeight * 0.065;
final double shaderHeight = kActualDeviceHeight * 0.75;

final generalPadding = EdgeInsets.symmetric(
  vertical: verticalSpacing,
  horizontal: horizontalSpacing,
);
final generalSmallPadding = EdgeInsets.symmetric(
  vertical: verticalSpacing / 2,
  horizontal: horizontalSpacing / 2,
);
final inputPadding = EdgeInsets.symmetric(
  vertical: verticalSpacing / 2,
  horizontal: horizontalSpacing,
);

const Duration generalDuration = Duration(milliseconds: 400);

final generalRadius = BorderRadius.circular(horizontalSpacing);
