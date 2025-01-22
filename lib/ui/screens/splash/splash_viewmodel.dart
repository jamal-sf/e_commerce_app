import 'package:e_commerce/routes.dart';
import 'package:get/get.dart';

class SplashScreenViewmodel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(4.seconds).then(
      (value) {
        Get.offAllNamed(routeLogin);
      },
    );
  }
}
