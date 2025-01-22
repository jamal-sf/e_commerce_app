import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/helpers/date_utils.dart';
import 'package:e_commerce/ui/screens/orders/orders_viewmodel.dart';
import 'package:e_commerce/ui/screens/profile/profiel_viewmodel.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersViewmodel());
    final profileViewmodel = Get.find<ProfileViewmodel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: ListView.separated(
        padding: generalPadding,
        itemBuilder: (context, index) {
          final order = profileViewmodel.user.orders[index];

          // *** List Of Product Text ***
          final productText = order.products
              .map((product) => 'X${product.quantity} ${product.product.name}')
              .join('\n');

          //** Calculate Total **
          print(order.products.map((e) => e.quantity * e.product.price));
          num totalPrice = order.products
              .map((e) => e.quantity * e.product.price)
              .toList()
              .reduce((a, b) => a + b);

          final trailingText =
              '${DateTimeUtils.formatDate(order.orderDate)}\n${DateTimeUtils.formatTime(order.orderDate)}\nAED $totalPrice';

          return ListTile(
            title: Text('${order.orderId} (${order.orderStatus})'),
            leading: const Icon(
              Icons.shopping_bag,
              color: AppColors.primary,
            ),
            subtitle: Text(
              productText,
              style: const TextStyle(color: AppColors.grey),
            ),
            trailing: Text(
              trailingText,
              textAlign: TextAlign.end,
            ),
          );
        },
        separatorBuilder: (context, index) =>
            const Divider(color: AppColors.grey_10),
        itemCount: profileViewmodel.user.orders.length,
      ),
    );
  }
}
