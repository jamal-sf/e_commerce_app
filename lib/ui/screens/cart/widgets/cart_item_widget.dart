import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/models/product.dart';
import 'package:e_commerce/routes.dart';
import 'package:e_commerce/ui/screens/cart/cart_viewmodel.dart';
import 'package:e_commerce/ui/screens/cart/widgets/quantity_selector.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:e_commerce/ui/styles/decorations.dart';
import 'package:e_commerce/ui/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.product,
    required this.viewmodel,
    required this.quantity,
  });

  final Product product;
  final CartViewmodel viewmodel;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(routeProductDetails, arguments: product);
      },
      child: Container(
        decoration: cardDecoration(color: AppColors.white, withShadow: true),
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.only(
          bottom: verticalSpacing,
        ),
        child: Row(
          children: [
            Image.network(
              product.imageUrl,
              width: kDeviceWidth * 0.2,
              height: kDeviceWidth * 0.2,
              fit: BoxFit.cover,
            ),
            generalBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name),
                  Text(
                    product.description,
                    style: tStyles['grey12'],
                    maxLines: 1,
                  ),
                  Text(
                    'AED ${product.price}',
                    style: tStyles['primary12mid'],
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            generalSmallBox,
            QuantitySelector(
              viewmodel: viewmodel,
              product: product,
              quantity: quantity,
            ),
            generalBox,
          ],
        ),
      ),
    );
  }
}
