import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/models/product.dart';
import 'package:e_commerce/routes.dart';
import 'package:e_commerce/ui/screens/home/home_viewmodel.dart';
import 'package:e_commerce/ui/styles/decorations.dart';
import 'package:e_commerce/ui/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeGridWidget extends StatelessWidget {
  const HomeGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder(builder: (HomeScreenViewmodel viewmodel) {
        return GridView.builder(
          itemCount: viewmodel.productsToShow.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: horizontalSpacing,
            mainAxisSpacing: verticalSpacing,
          ),
          padding: generalPadding,
          itemBuilder: (context, index) {
            Product product = viewmodel.productsToShow[index];
            return GridItem(product: product);
          },
        );
      }),
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(routeProductDetails, arguments: product);
      },
      child: Container(
        decoration: cardDecoration(
          withShadow: true,
          borderRadius: BorderRadius.circular(
            horizontalSpacing / 2,
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: product.imageUrl,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  width: kDeviceWidth,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: verticalSpacing / 4,
                horizontal: horizontalSpacing / 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: tStyles['black16mid'],
                    maxLines: 1,
                  ),
                  Text(
                    product.description,
                    maxLines: 1,
                    style: tStyles['grey12'],
                  ),
                  generalSmallBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'AED ${product.price}',
                        maxLines: 1,
                        style: tStyles['black18semi'],
                      ),
                      // Container(
                      //   decoration: circleDecoration(
                      //     color: AppColors.primary,
                      //   ),
                      //   padding: const EdgeInsets.all(4),
                      //   child: const Icon(
                      //     Icons.add,
                      //     color: AppColors.white,
                      //     size: 18,
                      //   ),
                      // )
                    ],
                  )
                ],
              ),
            ),
            generalSmallBox,
          ],
        ),
      ),
    );
  }
}
