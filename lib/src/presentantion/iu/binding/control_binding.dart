import 'package:get/instance_manager.dart';

import '../controllers/export_controllers.dart';


class ControlBinding extends Bindings{
  
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ControlController(localRepositoryInterface: Get.find(),controlRepositoryInterface: Get.find()));

    
  }


}