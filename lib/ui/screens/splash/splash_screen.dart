import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:e_commerce/ui/screens/splash/splash_viewmodel.dart';
import 'package:e_commerce/ui/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenViewmodel());
    return Scaffold(
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Welcome To\neCommerce',
              textStyle: tStyles['primary32bold'],
              speed: 100.milliseconds,
              textAlign: TextAlign.center,
            ),
          ],
          totalRepeatCount: 1,
          pause: const Duration(milliseconds: 10),
          displayFullTextOnTap: false,
          stopPauseOnTap: false,
        ),
      ),
    );
  }
}
