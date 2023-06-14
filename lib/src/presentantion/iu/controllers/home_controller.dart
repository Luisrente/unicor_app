import 'dart:developer';
import 'package:get/get.dart';
import '../../../domain/models/export_model.dart';
import '../../../domain/repository/export_repository.dart';
import '../../../domain/repository/local_storage_repository.dart';


class HomeController extends GetxController {


final LocalRepositoryInterface localRepositoryInterface;
final AuthRepositoryInterface authRepositoryInterface;


  static HomeController initializeController() {
    try {
      HomeController controller = Get.find<HomeController>();
      return controller;
    } catch (e) {
      HomeController controller = Get.put(HomeController( localRepositoryInterface:Get.find(), authRepositoryInterface:Get.find()));
      return controller;
    }
  }


 HomeController({ 
  required this.localRepositoryInterface ,
  required this.authRepositoryInterface ,
  });


// https://www.ateneo.edu/sites/default/files/styles/large/public/2021-11/istockphoto-517998264-612x612.jpeg?itok=aMC1MRHJ
// https://profilePicture.freepik.com/foto-gratis/disparo-gran-angular-solo-arbol-que-crece-cielo-nublado-puesta-sol-rodeada-cesped_181624-22807.jpg?w=2000
//  Rx<User> user= User.empty().obs;
 Rx<User> newuser= User().obs;
 RxString path = ''.obs;



 @override
 void onReady(){
  super.onReady();
  loadUser();
}

void loadUser() async{
  final currentUser = await localRepositoryInterface.getUser();
  log( '$currentUser');
  // user(currentUser);
}

Future<bool> deleteUder() async{
  try {
    final currentUser = await localRepositoryInterface.getUser();
    final delte = await authRepositoryInterface.delete();
    if(delte){
     final clean= await  localRepositoryInterface.clearAllData();
    return true;
    }else{
    return true;
    }
  } catch (e) {
    return false;
  }
}













  


}