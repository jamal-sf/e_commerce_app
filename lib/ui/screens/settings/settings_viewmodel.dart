import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingsViewmodel extends GetxController {
  bool isNotificationEnabled = false;
  onNotificationSwitch(bool v) {
    isNotificationEnabled = v;
    update();
  }

  onPrivacyPolicyPressed() {
    launchUrlString('https://policies.google.com/privacy?hl=en-US');
  }

  onTermsPressed() {
    launchUrlString('https://policies.google.com/privacy?hl=en-US');
  }
}
