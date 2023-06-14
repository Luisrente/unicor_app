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

final emailTextController = TextEditingController();


 var loginState = LoginState.initial.obs;

 RxString corre = ''.obs;
 RxString password = ''.obs;


 RxString password1 = ''.obs;
 RxString password2 = ''.obs;
 String uid = '';





Future<User?> loadUser() async{
  final currentUser = await localRepositoryInterface.getUser();
  user(currentUser);
  return currentUser;
}

Future<bool> changePassword() async{
    try {
    loginState(LoginState.loading);
    final usuario = await localRepositoryInterface.getUser();
    final loginResponse = await authRepositoryInterface.changePass(usuario.uid! , password1.toString());
    await localRepositoryInterface.saveToken("loginResponse.token");
    await localRepositoryInterface.saveUser(usuario);
    return true;
    } on AuthException catch(_)  {
      loginState(LoginState.initial);
      return false;
    }
  }

Future<bool> changePasswordVer() async{
    try {
    loginState(LoginState.loading);
    final usuario = await localRepositoryInterface.getUser();

    final loginResponse = await authRepositoryInterface.changePass(usuario.uid! , password1.toString());
    await localRepositoryInterface.saveToken("loginResponse.token");
    await localRepositoryInterface.saveUser(loginResponse);
    return true;
    } on AuthException catch(_)  {
      loginState(LoginState.initial);
      return false;
    }
  }

Future<bool> verifyCodepas(String code ) async{
    // final email= enamilTextController.text;
    try {
    final loginResponse = await authRepositoryInterface.verifyCode(corre.toString() , code);
    await localRepositoryInterface.saveToken("loginResponse.token");
   await  localRepositoryInterface.saveUser(loginResponse.user!);
    return true;
    } on AuthException catch(_)  {
      loginState(LoginState.initial);
      return false;
    }
  }


Future<bool> login() async{
    loginState(LoginState.loading);
    try {
    final loginResponse = await authRepositoryInterface.login(LoginRequest( corre.toString() , password.toString()));
    await localRepositoryInterface.saveToken(loginResponse.token!);
    await localRepositoryInterface.saveUser(loginResponse.user!);

   final suer=     await localRepositoryInterface.getUser();

    loadUser();
    loginState(LoginState.initial);

    return true;
    } on AuthException catch(_)  {
    loginState(LoginState.initial);
      return false;
    }
  }

Future<void> logout() async{
  await localRepositoryInterface.clearAllData();
  Get.offAllNamed(Routes.login);
}


Future<void> routerRol() async{
      final usuario = await localRepositoryInterface.getUser();
      try { 
      final usuario = await localRepositoryInterface.getUser();
      if (usuario.status=='REGISTER' ){
      Get.offAllNamed(Routes.home , arguments: usuario);
      }else{
      if(usuario.role == "ESTUDIANTE")
      Get.offAllNamed(Routes.home);

      if(usuario.role == "ADMIN")
      Get.offAllNamed(Routes.admin);
      
      }

      } catch (e) {
      Get.offAllNamed(Routes.login );
      }
}



  Future<bool> sendPassword() async{
    try {
    loginState(LoginState.loading);
    final loginResponse = await authRepositoryInterface.send(corre.toString());
    return true;
    } on AuthException catch(_)  {
      loginState(LoginState.initial);
      return false;
    }
  }


}