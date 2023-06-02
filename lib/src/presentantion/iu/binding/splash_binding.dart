

import 'package:get/instance_manager.dart';

import '../controllers/export_controllers.dart';


class SplashBinding extends Bindings{
  
  @override
  void dependencies() {
    // TODO: implement dependencies
     Get.lazyPut(() => SplashController(localRepositoryInterface: Get.find(), authRepositoryInterface: Get.find()));
  }


}