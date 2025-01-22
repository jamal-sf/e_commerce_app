import 'package:e_commerce/core/models/address.dart';
import 'package:e_commerce/core/models/payment_method.dart';
import 'package:e_commerce/ui/screens/profile/profiel_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CheckoutViewmodel extends GetxController {
  Address? selectedAddress;
  PaymentMethod? seletedPaymentMethod;
  List<Address> addresses = Get.find<ProfileViewmodel>().user.addresses;

  List<PaymentMethod> paymentMethods = [
    PaymentMethod(
        name: 'Credit/Debit Card', icon: CupertinoIcons.creditcard_fill),
    PaymentMethod(name: 'Paypal', icon: FontAwesomeIcons.paypal),
    PaymentMethod(name: 'On Delivery', icon: Icons.delivery_dining),
  ];

  onAddressSelected(Address adress) {
    selectedAddress = adress;
    update();
  }

  onPaymentMethodSelected(PaymentMethod paymentMethod) {
    seletedPaymentMethod = paymentMethod;
    update();
  }
}
