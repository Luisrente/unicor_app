

import 'package:get/instance_manager.dart';

import '../controllers/export_controllers.dart';


class AuthBinding extends Bindings{
  
  @override
  void dependencies() {
    // TODO: implement dependencies
     Get.lazyPut(() => AuthController(localRepositoryInterface: Get.find(), authRepositoryInterface: Get.find()));
    //  Get.lazyPut(() => HomeController(localRepositoryInterface: Get.find(), apiRepositoryInterface: Get.find()));
  }


}