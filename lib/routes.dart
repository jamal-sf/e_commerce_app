import 'package:e_commerce/ui/screens/cart/cart_screen.dart';
import 'package:e_commerce/ui/screens/checkout/checkout_screen.dart';
import 'package:e_commerce/ui/screens/home/home_screen.dart';
import 'package:e_commerce/ui/screens/login/login_screen.dart';
import 'package:e_commerce/ui/screens/order_confirmation/order_confirm_screen.dart';
import 'package:e_commerce/ui/screens/orders/orders_screen.dart';
import 'package:e_commerce/ui/screens/product_details/product_details_screen.dart';
import 'package:e_commerce/ui/screens/profile/profile_screen.dart';
import 'package:e_commerce/ui/screens/settings/settings_screen.dart';
import 'package:e_commerce/ui/screens/sign_up/sign_up_screen.dart';
import 'package:e_commerce/ui/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

const String routeSplash = '/';
const String routeLogin = '/login';
const String routeSignUp = '/sign_up';
const String routeHome = '/home';
const String routeProductDetails = '/product_details';
const String routeCart = '/cart';
const String routeCheckout = '/checkout';
const String routeOrderConfirmation = '/order_confrimation';
const String routeProfile = '/profile';
const String routerSettings = '/settings';
const String routeOrders = '/orders';

List<GetPage> routes = [
  GetPage(
    name: routeSplash,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: routeLogin,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: routeSignUp,
    page: () => const SignUpScreen(),
  ),
  GetPage(
    name: routeHome,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: routeProductDetails,
    page: () => const ProductDetailsScreen(),
  ),
  GetPage(
    name: routeCart,
    page: () => const CartScreen(),
  ),
  GetPage(
    name: routeCheckout,
    page: () => const CheckoutScreen(),
  ),
  GetPage(
    name: routeOrderConfirmation,
    page: () => const OrderConfirmationScreen(),
  ),
  GetPage(
    name: routeProfile,
    page: () => const ProfileScreen(),
  ),
  GetPage(
    name: routerSettings,
    page: () => const SettingsScreen(),
  ),
  GetPage(
    name: routeOrders,
    page: () => const OrdersScreen(),
  ),
];
