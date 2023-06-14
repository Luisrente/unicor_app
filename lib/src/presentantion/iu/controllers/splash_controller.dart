

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
    try {
        if( token != null){
      final usuario = await localRepositoryInterface.getUser();
      final user = await authRepositoryInterface.getUserFromToken(usuario.uid!);
      await localRepositoryInterface.saveUser(user);    
      routerRol() ;
    }else{
      Get.toNamed(Routes.login);
    }
      
    } catch (e) {
       Get.toNamed(Routes.login);

    }
    
  }

    void routerRol() async{
      final usuario = await localRepositoryInterface.getUser();
      if (usuario.status=='REGISTER' ){
      Get.offAllNamed(Routes.home , arguments: usuario);
      }else{
      if(usuario.role == "ESTUDIANTE")
      Get.offAllNamed(Routes.home);

      if(usuario.role == "ADMIN")
      Get.offAllNamed(Routes.admin);
      }


    }


}