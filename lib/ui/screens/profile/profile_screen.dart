import 'dart:io';

import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/routes.dart';
import 'package:e_commerce/ui/screens/profile/profiel_viewmodel.dart';
import 'package:e_commerce/ui/screens/profile/widgets/order_list.dart';
import 'package:e_commerce/ui/screens/profile/widgets/profile_picture.dart';
import 'package:e_commerce/ui/screens/profile/widgets/saved_addresses.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:e_commerce/ui/styles/decorations.dart';
import 'package:e_commerce/ui/styles/text.dart';
import 'package:e_commerce/ui/widgets/text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileViewmodel viewmodel = Get.find();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        padding: generalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfilePictureWidget(),
            generalBox,
            Text(
              'Your Name',
              style: tStyles['black16semi'],
            ),
            generalSmallBox,
            CustomTextInput(
              hint: 'UserName',
              textEditingController: viewmodel.nameController,
            ),
            generalBox,
            Text(
              'Your Email',
              style: tStyles['black16semi'],
            ),
            generalSmallBox,
            CustomTextInput(
              hint: 'Email',
              textEditingController: viewmodel.emailController,
            ),
            generalBox,
            Text(
              'Your Phone Number',
              style: tStyles['black16semi'],
            ),
            generalSmallBox,
            CustomTextInput(
              hint: 'Phone number',
              textEditingController: viewmodel.phoneNumberController,
            ),
            generalBox,
            Text(
              'Your Addresses',
              style: tStyles['black16semi'],
            ),
            generalSmallBox,
            SavedAddressWidget(viewmodel: viewmodel),
            generalBox,
            GestureDetector(
              onTap: () {
                Get.toNamed(routeOrders);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Orders',
                    style: tStyles['black16semi'],
                  ),
                  Text(
                    'See All',
                    style: tStyles['accent14semi'],
                  ),
                ],
              ),
            ),
            generalSmallBox,
            OrdersListWidget(viewmodel: viewmodel),
            generalBox,
          ],
        ),
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    title: const Text('Profile'),
    backgroundColor: AppColors.white,
    centerTitle: Platform.isIOS,
    actions: [
      CupertinoButton(
        child: const Icon(
          Icons.settings,
          color: AppColors.black,
        ),
        onPressed: () => Get.toNamed(routerSettings),
      ),
      CupertinoButton(
        child: const Icon(
          Icons.logout_outlined,
          color: AppColors.requiredField,
        ),
        onPressed: () => Get.offAllNamed(routeLogin),
      ),
    ],
  );
}

Widget buildUserInfoSection(ProfileViewmodel profileViewModel) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Your Name',
        style: tStyles['black16semi'],
      ),
      generalSmallBox,
      CustomTextInput(
        hint: 'UserName',
        textEditingController: profileViewModel.nameController,
      ),
      generalBox,
      Text(
        'Your Email',
        style: tStyles['black16semi'],
      ),
      generalSmallBox,
      CustomTextInput(
        hint: 'Email',
        textEditingController: profileViewModel.emailController,
      ),
      generalBox,
      Text(
        'Your Phone Number',
        style: tStyles['black16semi'],
      ),
      generalSmallBox,
      CustomTextInput(
        hint: 'Phone number',
        textEditingController: profileViewModel.phoneNumberController,
      ),
    ],
  );
}
