import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/ui/screens/settings/settings_viewmodel.dart';
import 'package:e_commerce/ui/styles/colors.dart';
import 'package:e_commerce/ui/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = Get.put(SettingsViewmodel());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: generalPadding,
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              trailing: GetBuilder(
                builder: (SettingsViewmodel viewmodel) {
                  return Switch.adaptive(
                    value: viewmodel.isNotificationEnabled,
                    onChanged: viewmodel.onNotificationSwitch,
                  );
                },
              ),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.creditcard),
              title: Text('Payment Methods'),
              trailing: Icon(CupertinoIcons.forward),
            ),
            const ListTile(
              leading: Icon(Icons.language_outlined),
              title: Text('Selected Language'),
              trailing: Text('EN'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: viewmodel.onPrivacyPolicyPressed,
            child: Text(
              'Privacy Policy ',
              style: tStyles['primary14semi'],
            ),
          ),
          Text(
            '-',
            style: tStyles['grey14semi'],
          ),
          GestureDetector(
            onTap: viewmodel.onTermsPressed,
            child: Text(
              ' Terms & Conditions',
              style: tStyles['accent14semi']!.copyWith(
                color: AppColors.requiredField,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
