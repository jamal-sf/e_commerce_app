import 'package:e_commerce/core/models/review.dart';

class Product {
  final String imageUrl;
  final String name;
  final num price;
  final double rating;
  final String description;
  final List<Review> reviews;
  final String specifications;
  final List category;
  Product({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
    required this.reviews,
    required this.specifications,
    required this.category,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      price: (json['price'] as num),
      description: json['description'] as String,
      reviews: (json['reviews'] as List<dynamic>)
          .map((reviewJson) => Review.fromJson(reviewJson))
          .toList(),
      specifications: json['specifications'],
      category: json['category'] as List,
      rating: (json['rating'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'price': price,
      'description': description,
      'reviews': reviews.map((review) => review.toJson()).toList(),
      'specifications': specifications,
      'category': category,
      'rating': rating,
    };
  }
}
