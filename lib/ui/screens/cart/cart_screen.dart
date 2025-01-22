import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/models/cart_product.dart';
import 'package:e_commerce/core/models/product.dart';
import 'package:e_commerce/routes.dart';
import 'package:e_commerce/ui/screens/cart/cart_viewmodel.dart';
import 'package:e_commerce/ui/screens/cart/widgets/cart_item_widget.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:e_commerce/ui/styles/decorations.dart';
import 'package:e_commerce/ui/styles/text.dart';
import 'package:e_commerce/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: GetBuilder(
        builder: (CartViewmodel viewmodel) {
          return viewmodel.items.isEmpty
              ? Center(
                  child: Text(
                    'Add items to show here',
                    style: tStyles['grey16'],
                  ),
                )
              : ListView.builder(
                  itemCount: viewmodel.items.length,
                  padding: generalPadding,
                  itemBuilder: (context, index) {
                    CartProduct item = viewmodel.items[index];
                    Product product = item.product;
                    int quantity = item.quantity;
                    return CartItemWidget(
                      product: product,
                      viewmodel: viewmodel,
                      quantity: quantity,
                    );
                  },
                );
        },
      ),
      bottomNavigationBar: buildBottomSection(),
    );
  }

  Widget buildBottomSection() {
    return Container(
      decoration: cardDecoration(
        color: AppColors.white,
        withShadow: true,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            generalBox,
            Row(
              children: [
                generalBox,
                Expanded(
                  child: Text(
                    'Grand Total:',
                    style: tStyles['black18bold'],
                  ),
                ),
                GetBuilder(
                  builder: (CartViewmodel viewmodel) {
                    return Text(
                      'AED ${viewmodel.getTotal()}',
                      style: tStyles['primary18bold'],
                    );
                  },
                ),
                generalBox,
              ],
            ),
            generalBox,
            GetBuilder(
              builder: (CartViewmodel viewmodel) {
                return FullWidthButton(
                  text: 'Checkout',
                  onPress: viewmodel.items.isEmpty
                      ? null
                      : () {
                          Get.toNamed(routeCheckout);
                        },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
