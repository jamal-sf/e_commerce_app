import 'package:e_commerce/core/models/product.dart';

class CartProduct {
  final Product product;
  int quantity;

  CartProduct({
    required this.product,
    required this.quantity,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
    };
  }
}
