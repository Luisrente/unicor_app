import 'package:get/get.dart';

import '../../context/export_context.dart';

class LanguegeCrontroller extends GetxController {
  static LanguegeCrontroller initializeController() {
    try {
      LanguegeCrontroller controller = Get.find<LanguegeCrontroller>();
      return controller;
    } catch (e) {
      LanguegeCrontroller controller = Get.put(LanguegeCrontroller());
      return controller;
    }
  }

  static UserPreferences pref = UserPreferences();

  RxString status =
      (pref.getString('locale').isNotEmpty ? pref.getString('locale') : 'es')
          .obs;

  RxMap<String, Map<String, String>> lenguaje =
      <String, Map<String, String>>{}.obs;
}
