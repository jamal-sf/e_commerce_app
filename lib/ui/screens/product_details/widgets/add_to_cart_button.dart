import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/ui/screens/cart/cart_viewmodel.dart';
import 'package:e_commerce/ui/screens/product_details/product_details_viewmodel.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:e_commerce/ui/styles/decorations.dart';
import 'package:e_commerce/ui/styles/text.dart';
import 'package:e_commerce/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.viewmodel,
  });

  final ProductDetailsScreenViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    Curve buttonCurve = Curves.easeOutBack;
    return GetBuilder(
      builder: (CartViewmodel cartViewmodel) {
        return Row(
          children: [
            AnimatedScale(
              duration: 200.milliseconds,
              curve: buttonCurve,
              scale: cartViewmodel.getQuantityFromCart(viewmodel.product) != 0
                  ? 1
                  : 0,
              child: AnimatedSize(
                duration: 400.milliseconds,
                curve: buttonCurve,
                child: Container(
                  width:
                      cartViewmodel.getQuantityFromCart(viewmodel.product) != 0
                          ? null
                          : 0,
                  height: kDeviceHeight * 0.08,
                  padding: EdgeInsets.symmetric(horizontal: horizontalSpacing),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          cartViewmodel.removeFromCart(viewmodel.product);
                        },
                        child: Container(
                          decoration:
                              circleDecoration(color: AppColors.requiredField),
                          child: const Icon(
                            Icons.remove,
                            color: AppColors.white,
                            //size: 18,
                          ),
                        ),
                      ),
                      generalSmallBox,
                      Text(
                        cartViewmodel
                            .getQuantityFromCart(viewmodel.product)
                            .toString(),
                        style: tStyles['black16'],
                      ),
                      generalSmallBox,
                      GestureDetector(
                        onTap: () {
                          cartViewmodel.addToCart(viewmodel.product);
                        },
                        child: Container(
                          decoration:
                              circleDecoration(color: AppColors.primary),
                          child: const Icon(
                            Icons.add,
                            color: AppColors.white,
                            //  size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedScale(
              duration: 200.milliseconds,
              curve: buttonCurve,
              scale: cartViewmodel.getQuantityFromCart(viewmodel.product) == 0
                  ? 1
                  : 0,
              child: AnimatedSize(
                duration: 400.milliseconds,
                curve: buttonCurve,
                child: SizedBox(
                  width:
                      cartViewmodel.getQuantityFromCart(viewmodel.product) == 0
                          ? null
                          : 0,
                  child: FittedBox(
                    child: CButton(
                      text: 'Add to cart',
                      onPress: () {
                        Get.find<CartViewmodel>().addToCart(viewmodel.product);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
