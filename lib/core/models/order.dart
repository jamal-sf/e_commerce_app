import 'package:e_commerce/core/helpers/date_utils.dart';
import 'package:e_commerce/core/models/cart_product.dart';

class Order {
  final String orderId;
  final DateTime orderDate;
  final List<CartProduct> products;
  final String orderStatus;

  Order({
    required this.orderId,
    required this.orderDate,
    required this.products,
    required this.orderStatus,
  });

  // Factory constructor for creating an Order from JSON
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['orderId'] as String,
      orderDate:
          DateTime.parse(json['orderDate'] as String), // Parse date string
      products: (json['products'] as List<dynamic>)
          .map((productJson) => CartProduct.fromJson(productJson))
          .toList(),
      orderStatus: (json['orderStatus'] as String),
    );
  }

  // Convert Order object to JSON
  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'orderDate': orderDate.toIso8601String(),
      'products': products.map((product) => product.toJson()).toList(),
      'orderStatus': orderStatus.toString().split('.').last,
    };
  }

  String getFormattedDate() {
    return DateTimeUtils.formatDate(orderDate); // Format the date
  }
}
