

import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
  

import '../../../domain/repository/export_repository.dart';
import '../../router/router.dart';

class SplashController extends GetxController{



  final LocalRepositoryInterface localRepositoryInterface;
  final AuthRepositoryInterface authRepositoryInterface;

  SplashController({
   required this.localRepositoryInterface,
   required this.authRepositoryInterface
  });

  @override
  void onReady() {
    validateSession();
    super.onReady();
  }


  void validateSession() async {
    final token = await localRepositoryInterface.getToken();

    if( token != null){
      final usuario = await localRepositoryInterface.getUser();
      final user = await authRepositoryInterface.getUserFromToken(usuario.uid!);
      await localRepositoryInterface.saveUser(user);    
      routerRol () ;
    }else{
      Get.toNamed(Routes.login);
    }
  }

    void routerRol () async{
      final usuario = await localRepositoryInterface.getUser();
      if (usuario.verifi=='false'){
      // Get.offNamed(Routes.verifyCode , arguments: usuario );
      }else{
      if(usuario.rol == 'USER_ROLE' && usuario.estado == true)
      Get.offAllNamed(Routes.home , arguments: usuario);

      
      if (usuario.rol == "")
      Get.off(Routes.login);


      }


    }


}