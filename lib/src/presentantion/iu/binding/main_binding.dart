import 'package:get/instance_manager.dart';

import '../../../data/export_repository_impl.dart';
import '../../../domain/repository/export_repository.dart';


class MainBinding extends Bindings {

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AuthRepositoryInterface>(() => AuthRepocitoryInterfaceImpl());
    Get.lazyPut<LocalRepositoryInterface>(() => LocalRepositoryImpl());
    Get.lazyPut<ControlRepositoryInterface>(() => ControlRepositoryImpl());

    
    // Get.lazyPut<ApiRepositoryInterface>(() => ApiRepositoryImpl());
    // Get.lazyPut<ControlRepositoryInterface>(() => ControlRepositoryImpl());
    // Get.lazyPut<UserRepositoryInterface>(() => UserRepositoryInterfaceImpl());
    
  }

}  