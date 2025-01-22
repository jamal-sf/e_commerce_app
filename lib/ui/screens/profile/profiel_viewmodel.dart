import 'package:e_commerce/core/models/address.dart';
import 'package:e_commerce/core/models/cart_product.dart';
import 'package:e_commerce/core/models/order.dart';
import 'package:e_commerce/core/models/product.dart';
import 'package:e_commerce/core/models/review.dart';
import 'package:e_commerce/core/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileViewmodel extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    nameController.text = user.name;
    emailController.text = user.email;
    nameController.text = user.name;
  }

  //*** Demo User ***/

  User user = User(
    email: 'email@example.com',
    name: 'Name Surname',
    phoneNumber: '050000000',
    orders: [
      Order(
        orderId: '#order-1254',
        orderDate: DateTime(2025, 1, 11, 12, 24),
        products: [
          CartProduct(
              product: Product(
                imageUrl:
                    'https://i.pinimg.com/736x/50/f1/7c/50f17c380525acf16c5ad8df185b1554.jpg',
                name: 'Caramel Macchiato',
                price: 18.00,
                description:
                    'Rich espresso layered with steamed milk, vanilla syrup, and topped with a caramel drizzle.',
                reviews: [
                  Review(author: 'John Doe', rating: 5, comment: 'Delicious!'),
                  Review(
                      author: 'Jane Smith',
                      rating: 4,
                      comment: 'Good, but a bit too sweet for me.'),
                ],
                specifications: 'Size: Grande (16 oz), Calories: 140',
                category: ['Coffee', 'Speacial Offers'],
                rating: 4.7,
              ),
              quantity: 2),
          CartProduct(
              product: Product(
                imageUrl:
                    'https://i.pinimg.com/736x/50/f1/7c/50f17c380525acf16c5ad8df185b1554.jpg',
                name: 'Caramel Macchiato',
                price: 18.00,
                description:
                    'Rich espresso layered with steamed milk, vanilla syrup, and topped with a caramel drizzle.',
                reviews: [
                  Review(author: 'John Doe', rating: 5, comment: 'Delicious!'),
                  Review(
                      author: 'Jane Smith',
                      rating: 4,
                      comment: 'Good, but a bit too sweet for me.'),
                ],
                specifications: 'Size: Grande (16 oz), Calories: 140',
                category: ['Coffee', 'Speacial Offers'],
                rating: 4.7,
              ),
              quantity: 6),
        ],
        orderStatus: 'Shipped',
      ),
      Order(
        orderId: '#order-1254',
        orderDate: DateTime(2025, 1, 11, 12, 24),
        products: [
          CartProduct(
              product: Product(
                imageUrl:
                    'https://i.pinimg.com/736x/50/f1/7c/50f17c380525acf16c5ad8df185b1554.jpg',
                name: 'Caramel Macchiato',
                price: 18.00,
                description:
                    'Rich espresso layered with steamed milk, vanilla syrup, and topped with a caramel drizzle.',
                reviews: [
                  Review(author: 'John Doe', rating: 5, comment: 'Delicious!'),
                  Review(
                      author: 'Jane Smith',
                      rating: 4,
                      comment: 'Good, but a bit too sweet for me.'),
                ],
                specifications: 'Size: Grande (16 oz), Calories: 140',
                category: ['Coffee', 'Speacial Offers'],
                rating: 4.7,
              ),
              quantity: 2),
          CartProduct(
              product: Product(
                imageUrl:
                    'https://i.pinimg.com/736x/50/f1/7c/50f17c380525acf16c5ad8df185b1554.jpg',
                name: 'Caramel Macchiato',
                price: 18.00,
                description:
                    'Rich espresso layered with steamed milk, vanilla syrup, and topped with a caramel drizzle.',
                reviews: [
                  Review(author: 'John Doe', rating: 5, comment: 'Delicious!'),
                  Review(
                      author: 'Jane Smith',
                      rating: 4,
                      comment: 'Good, but a bit too sweet for me.'),
                ],
                specifications: 'Size: Grande (16 oz), Calories: 140',
                category: ['Coffee', 'Speacial Offers'],
                rating: 4.7,
              ),
              quantity: 6),
        ],
        orderStatus: 'Shipped',
      ),
    ],
    addresses: [
      Address(name: 'Al Barsha, Dubai', icon: CupertinoIcons.home),
      Address(name: 'Downtown, Dubai', icon: CupertinoIcons.building_2_fill),
    ],
  );
}
