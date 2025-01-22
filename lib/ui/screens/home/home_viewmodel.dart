import 'package:e_commerce/core/models/product.dart';
import 'package:e_commerce/core/models/review.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenViewmodel extends GetxController {
  List<String> categoires = [
    'All',
    'Speacial Offers',
    'Coffee',
    'Tea',
  ];
  int selectedCatogryIndex = 0;
  TextEditingController searchController = TextEditingController();
  List<Product> products = [
    Product(
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
    Product(
      imageUrl:
          'https://i.pinimg.com/736x/52/34/90/5234907fb35fc29a79936fafc078e70f.jpg',
      name: 'Iced Vanilla Latte',
      price: 16.00,
      description:
          'Espresso with cold milk and vanilla syrup, served over ice.',
      reviews: [
        Review(
            author: 'Alice Johnson',
            rating: 5,
            comment: 'Perfect summer drink!'),
        Review(
            author: 'Bob Smith',
            rating: 4,
            comment: 'Refreshing, but could be stronger.'),
      ],
      specifications: 'Size: Tall (12 oz), Calories: 110',
      category: ['Coffee', 'Cold Drinks'],
      rating: 4.5,
    ),
    Product(
      imageUrl:
          'https://i.pinimg.com/736x/18/da/2f/18da2fad7461d22ec47f3a8d7da6e7b3.jpg',
      name: 'Mocha Frappuccino',
      price: 22.00,
      description:
          'Blended coffee, milk, chocolate syrup, ice, and whipped cream.',
      reviews: [
        Review(
            author: 'Charlie Brown',
            rating: 5,
            comment: 'My favorite coffee drink!'),
        Review(
            author: 'Lucy van Pelt',
            rating: 3,
            comment: 'A bit too chocolaty for me.'),
      ],
      specifications: 'Size: Venti (24 oz), Calories: 330',
      category: ['Coffee', 'Speacial Offers', 'Tea'],
      rating: 4.2,
    ),
    Product(
      imageUrl:
          'https://i.pinimg.com/736x/df/da/10/dfda10570d58c4d39a850516327ceb38.jpg',
      name: 'Nitro Cold Brew',
      price: 15.00,
      description:
          'Cold brew coffee infused with nitrogen for a smooth, creamy texture.',
      reviews: [
        Review(
            author: 'Sarah Lee',
            rating: 5,
            comment: 'So smooth and refreshing!'),
        Review(
            author: 'David Lee',
            rating: 4,
            comment: 'An acquired taste, but I like it.'),
      ],
      specifications: 'Size: Grande (16 oz), Calories: 50',
      category: [
        'Tea',
      ],
      rating: 4.4,
    ),
  ];

  List<Product> productsToShow = [];

  @override
  void onInit() {
    super.onInit();
    getProductsToShow();
  }

  List<Product> getProductsToShow() {
    return productsToShow = products
        .where((product) => _matchesSearchAndCategory(product))
        .toList();
  }

  bool _matchesSearchAndCategory(
    Product product,
  ) {
    final lowerCaseSearchTerm = searchController.text.toLowerCase();
    final lowerCaseProductName = product.name.toLowerCase();
    return (lowerCaseProductName.contains(lowerCaseSearchTerm) &&
        (getSelectedCatogry() == 'All' ||
            product.category.contains(getSelectedCatogry())));
  }

  void onCategorySelected(int index) {
    selectedCatogryIndex = index;
    getProductsToShow();
    update();
  }

  String getSelectedCatogry() {
    return categoires[selectedCatogryIndex];
  }

  onSearch(String value) {
    getProductsToShow();
    update();
  }
}
