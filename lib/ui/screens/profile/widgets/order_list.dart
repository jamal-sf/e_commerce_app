import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/models/order.dart';
import 'package:e_commerce/ui/screens/profile/profiel_viewmodel.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:e_commerce/ui/styles/decorations.dart';
import 'package:flutter/material.dart';

class OrdersListWidget extends StatelessWidget {
  const OrdersListWidget({
    super.key,
    required this.viewmodel,
  });

  final ProfileViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardDecoration(
        borderRadius: BorderRadius.circular(horizontalSpacing / 2),
      ),
      child: ListView.separated(
        padding: generalPadding,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: viewmodel.user.orders.length,
        separatorBuilder: (context, index) {
          return const Divider(color: AppColors.grey_10);
        },
        itemBuilder: (context, index) {
          Order order = viewmodel.user.orders[index];
          return ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: Text(order.orderId),
            subtitle: Text(order.getFormattedDate()),
            trailing: Text(
              order.orderStatus,
              style: TextStyle(
                  color: order.orderStatus == 'Confirmed'
                      ? AppColors.accent
                      : AppColors.primary),
            ),
          );
        },
      ),
    );
  }
}
