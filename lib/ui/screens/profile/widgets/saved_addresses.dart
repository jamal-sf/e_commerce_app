import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/models/address.dart';
import 'package:e_commerce/ui/screens/profile/profiel_viewmodel.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:e_commerce/ui/styles/decorations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavedAddressWidget extends StatelessWidget {
  const SavedAddressWidget({
    super.key,
    required this.viewmodel,
  });

  final ProfileViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardDecoration(
        borderRadius: BorderRadius.circular(horizontalSpacing / 2),
      ),
      child: ListView.separated(
        padding: generalPadding,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: viewmodel.user.addresses.length,
        separatorBuilder: (context, index) {
          return const Divider(color: AppColors.grey_10);
        },
        itemBuilder: (context, index) {
          Address address = viewmodel.user.addresses[index];
          return ListTile(
            leading: Icon(address.icon),
            title: Text(address.name),
            trailing: CupertinoButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              minSize: 0,
              child: const Icon(
                CupertinoIcons.delete,
                color: AppColors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
