import 'package:get/get.dart';

class NavBarController extends GetxController {

  static NavBarController initializeController() {
    try {
      NavBarController controller =
          Get.find<NavBarController>();
      return controller;
    } catch (e) {
      NavBarController controller =
          Get.put(NavBarController());
      return controller;
    }
  }

  RxInt currentIndex = 1.obs;
  
  int parentScreen = 0;

  void changeTo(int index){
    currentIndex.value = index;
  }

  void resetNavBarStatus(){
    currentIndex.value = 1;
    parentScreen = 0;
  }

  void setMiddleScreen(){
    parentScreen = currentIndex.value;
    currentIndex.value = 0;
  }
  
}