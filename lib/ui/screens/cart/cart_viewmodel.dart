import 'package:e_commerce/core/models/cart_product.dart';
import 'package:e_commerce/core/models/product.dart';
import 'package:get/get.dart';

class CartViewmodel extends GetxController {
  List<CartProduct> items = [];

  void addToCart(Product product) {
    CartProduct? item =
        items.firstWhereOrNull((element) => element.product == product);

    if (item != null) {
      item.quantity += 1;
    } else {
      items.add(CartProduct(product: product, quantity: 1));
    }
    update();
  }

  void removeFromCart(Product product) {
    CartProduct? item =
        items.firstWhereOrNull((element) => element.product == product);

    if (item != null) {
      item.quantity -= 1;
      if (item.quantity == 0) {
        items.remove(item);
      }
    }

    update();
  }

  int getQuantityFromCart(Product product) {
    CartProduct? item =
        items.firstWhereOrNull((element) => element.product == product);
    if (item == null) {
      return 0;
    } else {
      return item.quantity;
    }
  }

  double getTotal() {
    double total = 0;
    for (var i in items) {
      total += (i.product.price * i.quantity);
    }
    return total;
  }
}
