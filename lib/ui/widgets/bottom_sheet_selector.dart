import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:e_commerce/ui/styles/decorations.dart';
import 'package:e_commerce/ui/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetSelector extends StatelessWidget {
  const BottomSheetSelector({
    super.key,
    required this.list,
    required this.onItemSelected,
    required this.title,
  });
  final List list;
  final Function(dynamic v) onItemSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: generalPadding,
      decoration: cardDecoration(),
      child: SafeArea(
        child: Column(
          children: [
            Text(
              title,
              style: tStyles['black16bold'],
            ),
            generalBox,
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: AppColors.grey_10,
                  );
                },
                itemCount: list.length,
                itemBuilder: (context, index) {
                  dynamic item = list[index];
                  return ListTile(
                    leading: Icon(item.icon),
                    title: Text(item.name),
                    onTap: () {
                      onItemSelected.call(item);
                      Get.back();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
