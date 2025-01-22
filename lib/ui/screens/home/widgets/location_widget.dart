import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:e_commerce/ui/styles/text.dart';
import 'package:flutter/material.dart';

class HomeLocationWidget extends StatelessWidget {
  const HomeLocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalSpacing),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.location_on_outlined,
            color: AppColors.grey,
            size: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Location',
                style: tStyles['grey14'],
              ),
              const Text('Barsha, Dubai')
            ],
          ),
        ],
      ),
    );
  }
}
