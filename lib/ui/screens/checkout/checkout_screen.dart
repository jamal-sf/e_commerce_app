import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/models/order.dart';
import 'package:e_commerce/routes.dart';
import 'package:e_commerce/ui/screens/cart/cart_viewmodel.dart';
import 'package:e_commerce/ui/screens/checkout/checkout_viewmodel.dart';
import 'package:e_commerce/ui/screens/checkout/widgets/items_on_cart.dart';
import 'package:e_commerce/ui/screens/profile/profiel_viewmodel.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:e_commerce/ui/styles/decorations.dart';
import 'package:e_commerce/ui/styles/text.dart';
import 'package:e_commerce/ui/widgets/bottom_sheet_selector.dart';
import 'package:e_commerce/ui/widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartViewmodel cartViewmodel = Get.find();
    final CheckoutViewmodel checkoutViewmodel = Get.put(CheckoutViewmodel());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        padding: generalPadding,
        child: Column(
          children: [
            _buildCartItemsSection(cartViewmodel),
            generalBox,
            _buildAddressSelectionSection(checkoutViewmodel),
            generalBox,
            _buildPaymentMethodSelectionSection(checkoutViewmodel),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(cartViewmodel, checkoutViewmodel),
    );
  }

  Widget _buildCartItemsSection(CartViewmodel cartViewmodel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Items in your cart:', style: tStyles['black18semi']),
        generalSmallBox,
        ItemsOnYourCart(cartViewmodel: cartViewmodel),
      ],
    );
  }

  Widget _buildAddressSelectionSection(CheckoutViewmodel viewmodel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Selected Address:', style: tStyles['black18semi']),
        generalSmallBox,
        GestureDetector(
          onTap: () {
            Get.bottomSheet(
              BottomSheetSelector(
                list: viewmodel.addresses,
                onItemSelected: (address) {
                  viewmodel.onAddressSelected(address);
                },
                title: 'Select Address',
              ),
            );
          },
          child: GetBuilder(builder: (CheckoutViewmodel viewmodel) {
            return _buildSelectionTile(
              icon: viewmodel.selectedAddress?.icon ?? CupertinoIcons.home,
              title:
                  viewmodel.selectedAddress?.name ?? 'Press to select address',
            );
          }),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodSelectionSection(CheckoutViewmodel viewmodel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Selected Payment Method:', style: tStyles['black18semi']),
        generalSmallBox,
        GestureDetector(
          onTap: () {
            Get.bottomSheet(
              BottomSheetSelector(
                list: viewmodel.paymentMethods,
                onItemSelected: (method) {
                  viewmodel.onPaymentMethodSelected(method);
                },
                title: 'Select Payment Method',
              ),
            );
          },
          child: GetBuilder(builder: (CheckoutViewmodel viewmodel) {
            return _buildSelectionTile(
              icon: viewmodel.seletedPaymentMethod?.icon ??
                  CupertinoIcons.creditcard_fill,
              title: viewmodel.seletedPaymentMethod?.name ??
                  'Press to select payment method',
            );
          }),
        ),
      ],
    );
  }

  Widget _buildSelectionTile({required IconData icon, required String title}) {
    return Container(
      decoration: cardDecoration(color: AppColors.grey_5),
      padding: generalPadding,
      child: Row(
        children: [
          Icon(icon),
          generalSmallBox,
          Text(title),
        ],
      ),
    );
  }

  Widget _buildBottomBar(
      CartViewmodel cartViewmodel, CheckoutViewmodel checkoutViewmodel) {
    return Container(
      decoration: cardDecoration(color: AppColors.white, withShadow: true),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            generalBox,
            _buildGrandTotalRow(cartViewmodel),
            generalBox,
            _buildPlaceOrderButton(cartViewmodel, checkoutViewmodel),
          ],
        ),
      ),
    );
  }

  Widget _buildGrandTotalRow(CartViewmodel cartViewmodel) {
    return Row(
      children: [
        generalBox,
        Expanded(
          child: Text('Grand Total:', style: tStyles['black18bold']),
        ),
        GetBuilder<CartViewmodel>(
          builder: (viewmodel) {
            return Text(
              'AED ${viewmodel.getTotal()}',
              style: tStyles['primary18bold'],
            );
          },
        ),
        generalBox,
      ],
    );
  }

  Widget _buildPlaceOrderButton(
      CartViewmodel cartViewmodel, CheckoutViewmodel checkoutViewmodel) {
    return GetBuilder<CheckoutViewmodel>(
      builder: (viewmodel) {
        return FullWidthButton(
          text: 'Place Order',
          onPress: (viewmodel.selectedAddress == null ||
                  viewmodel.seletedPaymentMethod == null)
              ? null
              : () {
                  Get.find<ProfileViewmodel>().user.orders.add(
                        Order(
                          orderId: UniqueKey().toString(),
                          orderDate: DateTime.now(),
                          products: List.from(cartViewmodel.items),
                          orderStatus: 'Confirmed',
                        ),
                      );
                  Get.find<ProfileViewmodel>().update();
                  Get.toNamed(routeOrderConfirmation);
                },
        );
      },
    );
  }
}
