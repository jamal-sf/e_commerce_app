import 'package:e_commerce/core/models/product.dart';
import 'package:e_commerce/ui/screens/cart/cart_viewmodel.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:e_commerce/ui/styles/decorations.dart';
import 'package:e_commerce/ui/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({
    super.key,
    required this.viewmodel,
    required this.product,
    required this.quantity,
  });

  final CartViewmodel viewmodel;
  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            viewmodel.removeFromCart(product);
          },
          child: Container(
            decoration: circleDecoration(color: AppColors.requiredField),
            child: const Icon(
              Icons.remove,
              color: AppColors.white,
              size: 18,
            ),
          ),
        ),
        generalSmallBox,
        GetBuilder<CartViewmodel>(
          builder: (CartViewmodel viewmodel) {
            return Text(
              quantity.toString(),
              style: tStyles['black16'],
            );
          },
        ),
        generalSmallBox,
        GestureDetector(
          onTap: () {
            viewmodel.addToCart(product);
          },
          child: Container(
            decoration: circleDecoration(color: AppColors.primary),
            child: const Icon(
              Icons.add,
              color: AppColors.white,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
