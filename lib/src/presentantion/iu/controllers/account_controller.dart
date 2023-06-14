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



enum AccountState{
  loading,
  initial
}
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
 RxString identificationprofilePicture = ''.obs;
 RxString profileprofilePicture = ''.obs;
 var accountState = AccountState.initial.obs;


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


Future<User?> loadUserRefresh() async{
  final currentUser = await localRepositoryInterface.getUser();
  final authRepositoryInerface = await authRepositoryInterface.getUserFromToken(currentUser.uid!);
  await localRepositoryInterface.saveUser(authRepositoryInerface);
  log("${authRepositoryInerface.campus}");
  user(authRepositoryInerface);
  return currentUser;
}




Future<bool> upLoad( ) async {  
     accountState(AccountState.loading);
    try {
      final profilePicturePhoto= await authRepositoryInterface.loadPhoto(identificationprofilePicture.toString(), user.value.uid!, 'img');
      final profilePicture= await authRepositoryInterface.loadPhoto(profileprofilePicture.toString(), user.value.uid!, 'cedulaImg');
      final applica = authRepositoryInterface.application(user.value.uid!);
      final identificationPhoto= await authRepositoryInterface.userState( user.value.uid!);
      log("$applica");
    
      await localRepositoryInterface.saveUser(identificationPhoto!);
      await localRepositoryInterface.getUser();
      accountState(AccountState.initial);

      return true;
    } catch (e) {
      accountState(AccountState.initial);

      return false;
    }
  }

}