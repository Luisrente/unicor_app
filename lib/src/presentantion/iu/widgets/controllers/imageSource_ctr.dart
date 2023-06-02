import 'package:get/get.dart';

class ImageSourceController extends GetxController {
  static ImageSourceController initializeController() {
    try {
      ImageSourceController controller = Get.find<ImageSourceController>();
      return controller;
    } catch (e) {
      ImageSourceController controller = Get.put(ImageSourceController());
      return controller;
    }
  }

  RxString sourcePath = "".obs;
  RxMap<String, String> sourcesPath = <String, String>{}.obs;

  void setSourcePath(String widgetKey, String path) {
    sourcesPath[widgetKey] = path;
  }

  void clearData(){
    sourcesPath.clear();
  }

  String getSourcePath(String widgetKey) {
    if (sourcesPath.containsKey(widgetKey)) {
      return sourcesPath[widgetKey]!;
    } else {
      return "";
    }
  }
}
