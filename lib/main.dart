import 'package:e_commerce/routes.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          surface: AppColors.scaffoldBackground,
        ),
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.scaffoldBackground,
        ),
      ),
      getPages: routes,
    );
  }
}
