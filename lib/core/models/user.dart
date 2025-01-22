import 'package:e_commerce/core/models/address.dart';
import 'package:e_commerce/core/models/order.dart';

class User {
  String email;
  String name;
  String phoneNumber;
  List<Order> orders;
  List<Address> addresses;

  User({
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.orders,
    required this.addresses,
  });
}
