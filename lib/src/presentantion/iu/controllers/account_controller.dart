import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/datasource/auth_repository_impl.dart';
import '../../../data/export_repository_impl.dart';
import '../../../domain/exception/export_exception.dart';
import '../../../domain/models/export_model.dart';
import '../../../domain/repository/export_repository.dart';
import '../../../domain/repository/local_storage_repository.dart';
import '../../../domain/request/export_request.dart';
import '../../router/router.dart';


class AccountController extends GetxController {



final LocalRepositoryInterface localRepositoryInterface;
final AuthRepositoryInterface authRepositoryInterface;


  static AccountController initializeController() {
    
    try {
      AccountController controller = Get.find<AccountController>();
      return controller;
    } catch (e) {

      Get.lazyPut<LocalRepositoryInterface>(() => LocalRepositoryImpl());
      Get.lazyPut<AuthRepositoryInterface>(() => AuthRepocitoryInterfaceImpl());

      AccountController controller= Get.put(AccountController(localRepositoryInterface:Get.find(),authRepositoryInterface:Get.find()));
      return controller;
    }
  }

 AccountController({
  required this.localRepositoryInterface,
  required this.authRepositoryInterface,
 }
 );

 Rx<User> user= User.empty().obs;
 Rx<User> newuser= User().obs;
 RxString path = ''.obs;

final emailTextController = TextEditingController();

 RxString corre = ''.obs;
 RxString password = ''.obs;
 RxString cedulaImg = ''.obs;
 RxString profileImg = ''.obs;


@override
  void onInit() {
    super.onInit();
    loadUser();
  }
    

Future<User?> loadUser() async{
  final currentUser = await localRepositoryInterface.getUser();
  user(currentUser);
  return currentUser;
}


Future<bool> upLoad( ) async {  
    try {
      final imgPhoto= await authRepositoryInterface.loadPhoto(cedulaImg.toString(), user.value.uid!, 'img');
      final img= await authRepositoryInterface.loadPhoto(profileImg.toString(), user.value.uid!, 'cedulaImg');
      final cedulaPhoto= await authRepositoryInterface.userState( user.value.uid!);
      await localRepositoryInterface.saveUser(cedulaPhoto!);
      final User  g= await localRepositoryInterface.getUser();
      return true;
    } catch (e) {
      return false;
    }
  }

}