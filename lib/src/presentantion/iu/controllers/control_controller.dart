

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/models/export_model.dart';
import '../../../domain/repository/control_repository.dart';
import '../../../domain/repository/export_repository.dart';
import 'export_controllers.dart';

enum ControlState{
  loading,
  initial
}

class ControlController extends GetxController{


final ControlRepositoryInterface controlRepositoryInterface;
final LocalRepositoryInterface localRepositoryInterface;


 final SharedController _sharedController =
      SharedController.initializeController();

  static ControlController initializeController() {
    try {
      ControlController controller = Get.find<ControlController>();
      return controller;
    } catch (e) {
      ControlController controller = Get.put(ControlController( localRepositoryInterface:Get.find(), controlRepositoryInterface:Get.find()));
      return controller;
    }
  }


ControlController( {
  required this.localRepositoryInterface,
    required this.controlRepositoryInterface
  });
 Rx<User> userSearch= User.empty().obs;
 Rx<User> userCurrent= User.empty().obs;
 var controlState = ControlState.initial.obs;

// @override
//  void onReady(){
//   loadUser();
//   super.onReady();
// }

void loadUser() async{
  final currentUser = await localRepositoryInterface.getUser();
  log( '$currentUser');
   userCurrent(currentUser);
}
 

 
  Future<bool> validation(String id  ) async { 
     controlState(ControlState.loading);
    try {
      final controlResponse= await controlRepositoryInterface.searchUser(id.toString());
       userSearch(controlResponse);
      controlState(ControlState.initial);
      return true;
    } catch (e) {
      controlState(ControlState.initial);
      return false;
    }
  }
 
  Future<bool> validationQr(String id  ) async { 
     controlState(ControlState.loading);
    try {
      final controlResponse= await controlRepositoryInterface.searchUser(id.toString());
       userSearch(controlResponse);
      controlState(ControlState.initial);
      return true;
    } catch (e) {
      controlState(ControlState.initial);
      return false;
    }
  }

}