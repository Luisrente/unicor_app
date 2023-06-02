import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/exception/export_exception.dart';
import '../../../domain/models/export_model.dart';
import '../../../domain/repository/export_repository.dart';
import '../../../domain/repository/local_storage_repository.dart';
import '../../../domain/request/export_request.dart';
import '../../router/router.dart';



enum LoginState{
  loading,
  initial
}


class AuthController extends GetxController {


final LocalRepositoryInterface localRepositoryInterface;
final AuthRepositoryInterface authRepositoryInterface;


  static AuthController initializeController() {
    try {
      AuthController controller = Get.find<AuthController>();
      return controller;
    } catch (e) {
      AuthController controller = Get.put(AuthController( localRepositoryInterface:Get.find(), authRepositoryInterface:Get.find()));
      return controller;
    }
  }


 AuthController({ 
  required this.localRepositoryInterface ,
  required this.authRepositoryInterface ,
  });

 Rx<User> user= User.empty().obs;
 Rx<User> newuser= User().obs;
 RxString path = ''.obs;

   final enamilTextController = TextEditingController();


 var loginState = LoginState.initial.obs;

 RxString corre = ''.obs;
 RxString password = ''.obs;


 @override
 void onReady(){
  // super.onReady();
  //  loadUser();
}

Future<User?> loadUser() async{
  final currentUser = await localRepositoryInterface.getUser();
  user(currentUser);
}

Future<bool> changePassword() async{
    try {
    loginState(LoginState.loading);
    final usuario = await localRepositoryInterface.getUser();
    final loginResponse = await authRepositoryInterface.changePass(usuario.uid! , 'pass1.toString()');
    log('${loginResponse.usuario}------dhhdhdh-------jdj');
    await localRepositoryInterface.saveUser(loginResponse.usuario!);
    return true;
    } on AuthException catch(_)  {
      loginState(LoginState.initial);
      return false;
    }
  }

Future<bool> verifyCodepas(String code ) async{
    // final email= enamilTextController.text;
    try {
     final User usuario = await localRepositoryInterface.getUser();
     log('${usuario.correo}');
    final loginResponse = await authRepositoryInterface.verifyCode(usuario.correo!, code);
    return true;
    } on AuthException catch(_)  {
      loginState(LoginState.initial);
      return false;
    }
  }

Future<bool> login() async{
    try {
    final loginResponse = await authRepositoryInterface.login(LoginRequest( corre.toString() , password.toString()));
    await localRepositoryInterface.saveToken(loginResponse.token!);
    await localRepositoryInterface.saveUser(loginResponse.usuario!);
    loadUser();
    return true;
    } on AuthException catch(_)  {
      // loginState(LoginState.initial);
      return false;
    }
  }

Future logout() async{

  await localRepositoryInterface.clearAllData();
  Get.offAllNamed(Routes.login);



}

void routerRol() async{
      final usuario = await localRepositoryInterface.getUser();
      try {
      if (usuario.verifi=='false'){
      Get.offAllNamed(Routes.verifyCode , arguments: usuario );
      }else{
      if (usuario.rol == 'ADMIN_ROLE' && usuario.verifi == 'true')
      Get.offAllNamed(Routes.admin);

      if(usuario.rol == 'USER_ROLE' && usuario.verifi == 'verified')
      Get.offAllNamed(Routes.onBoarding , arguments: usuario);
      }
      } catch (e) {
      Get.offAllNamed(Routes.login );
      }
}

  Future<bool> sendPassword() async{
    final email= enamilTextController.text;
    try {
    loginState(LoginState.loading);
    final loginResponse = await authRepositoryInterface.send(corre.toString());
    await localRepositoryInterface.saveUser(loginResponse.usuario!);
    return true;
    } on AuthException catch(_)  {
      loginState(LoginState.initial);
      return false;
    }
  }










  


}