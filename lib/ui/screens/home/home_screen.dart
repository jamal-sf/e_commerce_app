import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/routes.dart';
import 'package:e_commerce/ui/screens/cart/cart_viewmodel.dart';
import 'package:e_commerce/ui/screens/home/home_viewmodel.dart';
import 'package:e_commerce/ui/screens/home/widgets/index.dart';
import 'package:e_commerce/ui/screens/profile/profiel_viewmodel.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:e_commerce/ui/styles/decorations.dart';
import 'package:e_commerce/ui/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = Get.put(HomeScreenViewmodel());
    final cartViewModel = Get.put(CartViewmodel());
    Get.put(ProfileViewmodel());

    return Scaffold(
      appBar: buildHomeAppBar(viewmodel, cartViewModel),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          generalBox,
          const HomeLocationWidget(),
          generalBox,
          // ****** SearchBar ****** //
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalSpacing),
            child: CupertinoSearchTextField(
              controller: viewmodel.searchController,
              onChanged: viewmodel.onSearch,
            ),
          ),
          generalSmallBox,
          const HomeCategoriesWidget(),
          const HomeGridWidget()
        ],
      ),
    );
  }
}

AppBar buildHomeAppBar(
  HomeScreenViewmodel homeViewModel,
  CartViewmodel cartViewModel,
) {
  return AppBar(
    leading: CupertinoButton(
      child: const Icon(
        CupertinoIcons.person,
        color: AppColors.black,
      ),
      onPressed: () => Get.toNamed(routeProfile),
    ),
    title: const Text('Home'),
    actions: [
      Stack(
        children: [
          CupertinoButton(
            onPressed: () => Get.toNamed(routeCart),
            child: const Icon(
              CupertinoIcons.cart,
              color: AppColors.black,
            ),
          ),
          Positioned(
            right: 4,
            child: GetBuilder<CartViewmodel>(
              builder: (cartViewModel) => Visibility(
                visible: cartViewModel.items.isNotEmpty,
                child: Container(
                  decoration: circleDecoration(color: AppColors.red),
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    cartViewModel.items.length.toString(),
                    style: tStyles['white12bold'],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ],
  );
}
