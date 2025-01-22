import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/ui/screens/home/home_viewmodel.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:e_commerce/ui/styles/decorations.dart';
import 'package:e_commerce/ui/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategoriesWidget extends StatelessWidget {
  const HomeCategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kDeviceHeight * 0.05,
      child: GetBuilder<HomeScreenViewmodel>(
        builder: (HomeScreenViewmodel viewmodel) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
              vertical: verticalSpacing / 4,
              horizontal: horizontalSpacing,
            ),
            itemBuilder: (context, index) {
              String currentCategory = viewmodel.categoires[index];
              bool isSelected = viewmodel.selectedCatogryIndex == index;
              return GestureDetector(
                onTap: () {
                  viewmodel.onCategorySelected(index);
                },
                child: AnimatedContainer(
                  duration: 200.milliseconds,
                  curve: Curves.easeInOutBack,
                  decoration: cardDecoration(
                      color:
                          isSelected ? AppColors.primary : AppColors.grey_10),
                  margin: EdgeInsets.only(right: horizontalSpacing / 2),
                  padding: EdgeInsets.symmetric(
                    // vertical: verticalSpacing / 2,
                    horizontal: isSelected
                        ? horizontalSpacing * 1.2
                        : horizontalSpacing,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    currentCategory,
                    style: tStyles[isSelected ? 'white14semi' : 'black14'],
                  ),
                ),
              );
            },
            itemCount: viewmodel.categoires.length,
          );
        },
      ),
    );
  }
}
