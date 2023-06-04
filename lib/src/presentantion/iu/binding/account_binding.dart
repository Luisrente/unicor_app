

import 'package:get/instance_manager.dart';

import '../controllers/export_controllers.dart';


class AccountBinding extends Bindings{
  
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AccountController(localRepositoryInterface: Get.find(),authRepositoryInterface: Get.find()));

    
  }


}