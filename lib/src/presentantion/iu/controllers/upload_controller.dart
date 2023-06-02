import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadPhotoController extends GetxController {


  static UploadPhotoController initializeController() {
    try {
      UploadPhotoController controller = Get.find<UploadPhotoController>();
      return controller;
    } catch (e) {
      UploadPhotoController controller = Get.put(UploadPhotoController());
      return controller;
    }
  }


  
  late List<Widget> formSteps = [];
  RxMap<int, int> stepsToDraw = <int, int>{1: 0, 2: 0, 3: 0}.obs;


}
