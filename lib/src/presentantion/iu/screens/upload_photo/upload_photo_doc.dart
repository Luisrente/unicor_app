import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '/src/presentantion/iu/screens/upload_photo/upload_photo_profile.dart';

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
        }
          );
    }else{

       QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: 'Lo sentimos por la dificultad al cargar las fotos. Por favor, intenta verificar tu conexión a Internet y el tamaño/formato de las imágenes. Si el problema persiste, contacta al soporte técnico',
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
            Obx(() => _sharedController.isLoading.value
                ? buildLoadingIndicator()
                : Container())
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

          TitleText(
          'Cedula cara frontal',
          margin: const EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
        ),


        CustomImageSourceWidget(
            key: Key(
                "${_accountController.user.value.img}"),
            imageContainerHeight: 220.0,
            onImageSourceChanged: (File image) {
              _accountController.cedulaImg.value=image.path;   
            }
            ),


         const  TitleText(
          'Foto de perfil',
          margin: const EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
        ),

        CustomImageSourceWidget(
            key: Key("{_accountController.user.value.img}"),
            imageContainerHeight: 250.0,
            onImageSourceChanged: (File image) {
            _accountController.profileImg.value=image.path;   
            }),
         Obx(
           () {
              return  CustomButton(
                label: "Subir",
                margin: const EdgeInsets.symmetric(vertical: 15.0),
                constraints: const BoxConstraints(maxWidth: 300.0),
                backgroundColor: AppAssets.blackColor,
                onPressed: (
                         _accountController.profileImg.value == '' ||
                         _accountController.cedulaImg.value == '' 
                     ) 
                    ? null
                    : () => upload(context)
                );
           }
           ),          ],

    )
    );


  }
    
}
