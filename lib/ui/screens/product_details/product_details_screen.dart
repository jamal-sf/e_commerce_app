import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/models/review.dart';
import 'package:e_commerce/ui/screens/product_details/product_details_viewmodel.dart';
import 'package:e_commerce/ui/screens/product_details/widgets/add_to_cart_button.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:e_commerce/ui/styles/decorations.dart';
import 'package:e_commerce/ui/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = Get.put(ProductDetailsScreenViewmodel());

    return Scaffold(
      bottomNavigationBar: _buildBottomBar(viewmodel),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductImageSection(viewmodel),
          Expanded(
            child: SingleChildScrollView(
              padding: generalPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProductInfo(viewmodel),
                  generalSmallBox,
                  _buildProductDescription(viewmodel),
                  generalBox,
                  _buildSpecifications(viewmodel),
                  generalBox,
                  _buildReviews(viewmodel),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build product image and back button section
  Widget _buildProductImageSection(ProductDetailsScreenViewmodel viewmodel) {
    return Stack(
      children: [
        Hero(
          tag: viewmodel.product.imageUrl,
          child: Image.network(
            viewmodel.product.imageUrl,
            height: kDeviceHeight * 0.4,
            width: kDeviceWidth,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: horizontalSpacing,
          child: SafeArea(
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              color: AppColors.black.withOpacity(0.5),
              child: const Icon(CupertinoIcons.back),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
      ],
    );
  }

  // Build the product name, price, and rating section
  Widget _buildProductInfo(ProductDetailsScreenViewmodel viewmodel) {
    return Row(
      children: [
        Expanded(
          child: Text(
            viewmodel.product.name,
            style: tStyles['black20semi'],
          ),
        ),
        Container(
          decoration: cardDecoration(color: AppColors.grey_5),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalSpacing / 2,
            vertical: verticalSpacing / 4,
          ),
          child: Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Text(
                viewmodel.product.rating.toStringAsFixed(1),
                style: tStyles['black14semi'],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Build the product description section
  Widget _buildProductDescription(ProductDetailsScreenViewmodel viewmodel) {
    return Text(
      viewmodel.product.description * 3,
      style: tStyles['grey14'],
    );
  }

  // Build the specifications section
  Widget _buildSpecifications(ProductDetailsScreenViewmodel viewmodel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Specifications:',
          style: tStyles['black18semi'],
        ),
        Container(
          decoration: cardDecoration(color: AppColors.grey_5),
          width: kDeviceWidth,
          padding: generalSmallPadding,
          child: Text(
            viewmodel.product.specifications,
            style: tStyles['grey14'],
          ),
        ),
      ],
    );
  }

  // Build the reviews section
  Widget _buildReviews(ProductDetailsScreenViewmodel viewmodel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reviews:',
          style: tStyles['black18semi'],
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            Review review = viewmodel.product.reviews[index];
            return _buildReviewItem(review);
          },
          itemCount: viewmodel.product.reviews.length,
        ),
      ],
    );
  }

  // Build individual review item
  Widget _buildReviewItem(Review review) {
    return Container(
      decoration: cardDecoration(color: AppColors.white),
      padding: generalSmallPadding,
      margin: EdgeInsets.symmetric(vertical: verticalSpacing / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                CupertinoIcons.person_alt_circle_fill,
                color: AppColors.grey,
              ),
              generalSmallBox,
              Text(
                review.author,
                style: tStyles['black16semi'],
              ),
              const Spacer(),
              _buildReviewRating(review),
            ],
          ),
          Text(
            review.comment,
            style: tStyles['grey14'],
          ),
        ],
      ),
    );
  }

  // Build the rating section for reviews
  Widget _buildReviewRating(Review review) {
    return Container(
      decoration: cardDecoration(color: AppColors.grey_5),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalSpacing / 2,
        vertical: verticalSpacing / 4,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Text(
            review.rating.toStringAsFixed(1),
            style: tStyles['black14semi'],
          ),
        ],
      ),
    );
  }

  // Build the bottom navigation bar with price and add to cart button
  Widget _buildBottomBar(ProductDetailsScreenViewmodel viewmodel) {
    return Container(
      decoration: cardDecoration(color: AppColors.white, withShadow: true),
      padding: EdgeInsets.symmetric(horizontal: horizontalSpacing),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: verticalSpacing),
          child: Row(
            children: [
              Text(
                'AED ${viewmodel.product.price}',
                style: tStyles['primary20bold'],
              ),
              const Spacer(),
              AddToCartButton(viewmodel: viewmodel),
            ],
          ),
        ),
      ),
    );
  }
}
