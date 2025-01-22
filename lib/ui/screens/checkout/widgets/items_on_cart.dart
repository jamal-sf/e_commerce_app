import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/models/cart_product.dart';
import 'package:e_commerce/core/models/product.dart';
import 'package:e_commerce/ui/screens/cart/cart_viewmodel.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:e_commerce/ui/styles/decorations.dart';
import 'package:e_commerce/ui/styles/text.dart';
import 'package:flutter/material.dart';

class ItemsOnYourCart extends StatelessWidget {
  const ItemsOnYourCart({
    super.key,
    required this.cartViewmodel,
  });

  final CartViewmodel cartViewmodel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardDecoration(color: AppColors.grey_5),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            color: AppColors.grey_10,
          );
        },
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: generalPadding,
        itemCount: cartViewmodel.items.length,
        itemBuilder: (context, index) {
          CartProduct item = cartViewmodel.items[index];
          Product product = item.product;
          int quantity = item.quantity;

          return Row(
            children: [
              Container(
                decoration: cardDecoration(
                  borderRadius: BorderRadius.circular(horizontalSpacing / 3),
                ),
                clipBehavior: Clip.hardEdge,
                height: kDeviceWidth * 0.1,
                width: kDeviceWidth * 0.1,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              generalSmallBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: tStyles['black14semi'],
                  ),
                  Text(
                    'AED ${product.price}',
                    style: tStyles['primary12semi'],
                  )
                ],
              ),
              const Spacer(),
              Text(
                'X $quantity',
                style: tStyles['black14bold'],
              )
            ],
          );
        },
      ),
    );
  }
}
