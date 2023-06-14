import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../context/app_assets.dart';
import '../../../router/router.dart';
import '../../controllers/export_controllers.dart';
import '../../widgets/controllers/stepper_ctr.dart';
import '../../widgets/custom/custom_stepper.dart';
import '../../widgets/custom/title_text.dart';
import '../../widgets/export_widget.dart';
import '../../widgets/others/shared.dart';

class UploadPhotoDocScreen extends StatelessWidget {
  static const routeName = "/createActivityMainScreen";

  final CustomStepperController _customStepperController =
      CustomStepperController.initializeController();

  final AccountController _accountController =
      AccountController.initializeController();

  final UploadPhotoController _activitiesController =
      UploadPhotoController.initializeController();
      
  final SharedController _sharedController =
      SharedController.initializeController();
  UploadPhotoDocScreen({Key? key}) : super(key: key);


   Future upload( BuildContext   context) async {
    final result  = await _accountController.upLoad();
    await  _accountController.loadUser();

    if(result){
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: 'Estamos emocionados de decirte que tu carnet digital ya está disponible para su visualización. Dirígete a tu perfil y disfruta de todos sus beneficios',
        onConfirmBtnTap:(){
      Get.offNamed(Routes.home);
        },
        barrierDismissible: true
          );
    }else{
       QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: 'Lo sentimos por la dificultad al cargar las fotos. Por favor, intenta statuscar tu conexión a Internet y el tamaño/formato de las imágenes. Si el problema persiste, contacta al soporte técnico',
        );
    }
   }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarPhoto(
  
        leadingWidget: TextButton(
          child:  Icon(Icons.chevron_left_outlined, size: 40),
          style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
          onPressed: () {
            Get.offAllNamed(Routes.home );
          },
        ) 
        ),
        body: Stack(
          children: [
            buildBody(context),
             Positioned.fill(
                child:Obx((){
                  if (_accountController.accountState.value == AccountState.loading){
                        return    Container(
                  color: Colors.black26,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
              );
                  }else{
                    return const SizedBox.shrink();
                  }
                }
                ) 
              )
         
          ],
        )
        
        );
  }

  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

    

const  TitleText(
          'Carnet digital',
          margin: const EdgeInsets.all(10),
          alignment: Alignment.topCenter,
        ),

  
        

        CustomImageSourceWidget(
            key: Key(
                "${_accountController.user.value.profilePicture}"),
            imageContainerHeight: 220.0,
            onImageSourceChanged: (File image) {
              _accountController.identificationprofilePicture.value=image.path;   
            }
            ),


         const  TitleText(
          'Foto de perfil',
          margin: const EdgeInsets.all(10),
          alignment: Alignment.topCenter,
        ),



        CustomImageSourceWidget(
            key: Key("{_accountController.user.value.profilePicture}"),
            imageContainerHeight: 250.0,
            onImageSourceChanged: (File image) {
            _accountController.profileprofilePicture.value=image.path;   
            }),
         Obx(
           () {
              return  CustomButton(
                label: "Subir",
                margin: const EdgeInsets.symmetric(vertical: 15.0),
                constraints: const BoxConstraints(maxWidth: 300.0),
                backgroundColor: AppAssets.blackColor,
                onPressed: (
                         _accountController.profileprofilePicture.value == '' ||
                         _accountController.identificationprofilePicture.value == '' 
                     ) 
                    ? null
                    : () => upload(context)
                );
           }
           ),     


           
           
           
               ],

    )
    );
  }
    
}
