import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/routes.dart';
import 'package:e_commerce/ui/screens/cart/cart_viewmodel.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:e_commerce/ui/styles/decorations.dart';
import 'package:e_commerce/ui/styles/text.dart';
import 'package:e_commerce/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.accent,
        width: kDeviceWidth,
        height: kDeviceHeight,
        padding: generalPadding,
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Get.find<CartViewmodel>().items.clear();
                    Get.find<CartViewmodel>().update();
                    Get.until(ModalRoute.withName(routeHome));
                  },
                  child: const Icon(
                    FontAwesomeIcons.house,
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(
                height: kDeviceHeight * 0.2,
              ),
              Center(
                child: Container(
                  decoration: circleDecoration(),
                  padding: const EdgeInsets.all(16),
                  child: const Icon(
                    Icons.done_rounded,
                    size: 80,
                    color: AppColors.accent,
                  ),
                ),
              ),
              generalBox,
              generalBox,
              Text(
                'Order Confirmed',
                style: tStyles['white22bold'],
              ),
              generalSmallBox,
              Text(
                '''Thank you for your order
Order Number: #ecom4398
Your order expected to be deliverd tommorow between 08:00 AM and 06:00 PM
                ''',
                textAlign: TextAlign.center,
                style: tStyles['white16']!.copyWith(
                  color: AppColors.white.withOpacity(0.8),
                ),
              ),
              const Spacer(),
              FullWidthButton(
                text: 'Back To Home Screen',
                withMargin: false,
                color: AppColors.white,
                textColor: AppColors.accent,
                onPress: () {
                  Get.find<CartViewmodel>().items.clear();
                  Get.find<CartViewmodel>().update();
                  Get.until(ModalRoute.withName(routeHome));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
