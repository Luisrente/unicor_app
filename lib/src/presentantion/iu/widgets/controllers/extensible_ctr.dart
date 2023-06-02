import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExtensibleWidgetController extends GetxController {
  static ExtensibleWidgetController initializeController() {
    try {
      ExtensibleWidgetController controller =
          Get.find<ExtensibleWidgetController>();
      return controller;
    } catch (e) {
      ExtensibleWidgetController controller =
          Get.put(ExtensibleWidgetController());
      return controller;
    }
  }

  RxList<List<Widget>> items = <List<Widget>>[].obs;

  void addOtherTemplate(List<Widget> contentTemplate) {
    items.add(contentTemplate);
  }

  void removeTemplate(int indexToRemove) {
    items.removeAt(indexToRemove);
  }
}
