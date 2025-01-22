import 'package:e_commerce/core/models/product.dart';
import 'package:get/get.dart';

class ProductDetailsScreenViewmodel extends GetxController {
  late Product product;

  @override
  void onInit() {
    super.onInit();
    product = Get.arguments;
  }
}
