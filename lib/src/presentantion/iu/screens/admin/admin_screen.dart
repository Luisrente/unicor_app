

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quickalert/quickalert.dart';


import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';


import '../../../context/export_context.dart';
import '../../../router/router.dart';
import '../../../utils/encryption_utils.dart';
import '../../../utils/show_alert.dart';
import '../../controllers/control_controller.dart';
import '../../widgets/export_widget.dart';


class AdminScreen extends GetWidget<ControlController> {


   AdminScreen({super.key});


   void search( BuildContext context, String id ) async {
    try {  

    final result  = await controller.validationQr(id);

    if(result ){
      Get.toNamed(Routes.adminDetails);
    }else{
        return  QuickAlert.show(
   context: context,
   type: QuickAlertType.error,
   title: 'Error...',
   text: 'El documento no está registrado o presenta un error. Verifica los detalles o contacta al administrador.',
  );
    }  
    } catch (e) {
      return  QuickAlert.show(
   context: context,
   type: QuickAlertType.error,
   title: 'Error...',
   text: 'El documento no está registrado o presenta un error. Verifica los detalles o contacta al administrador.',
  );
    }
   }


  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
        final double tam = MediaQuery.of(context).size.height * 0.17;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
       key: scaffoldKey,
      appBar: CustomAppBarPhoto(
        leadingWidget: TextButton(
          child:  Icon(Icons.menu),
          style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
          onPressed: () {
           scaffoldKey.currentState!.openDrawer();
          },
        )  
        ),
       drawer: Obx(() => AppDrawer(user: controller.userCurrent.value)),
      body: Stack(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                    children: [
                       const SizedBox(height: 40),
                      const Text(
                       "Consulta de informacion",
                       style: TextStyle(
                         fontWeight: FontWeight.bold, 
                         fontSize: 20.0,
                       ),
                       textAlign: TextAlign.center,
                       maxLines: 2,
                       overflow: TextOverflow.ellipsis,
                      ),
                     const  SizedBox(height: 30),

                      ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: size.width * 0.85),
                      child: const  Text(
                       "Para consultar la informaciones es necesario digitar el numero de documento de intentidad.",
                        textAlign: TextAlign.justify,
                        style:  TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w200),
                      ),
                    ),

                    const SizedBox(height: 30),

                     SearchBar(
                              margin: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 20.0),
                              labelButton: 'Buscar',
                              labelTextField: 'Buscar',
                              onSearch: (v) {
                                search(context, v);
                              },
                     ),
                      
                    ],
                  ),
                ),

                
                 Positioned.fill(
                child:Obx((){
                  if (controller.controlState.value == ControlState.loading){
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
      ),
            floatingActionButton:  FloatingActionButton(
              backgroundColor:AppAssets.primaryColor,              
              onPressed:()=> destroy('https://3.85.53.75:3000/gnjngnjgjn/eieieieieiieieieieiie') ,
              child: Icon(Icons.qr_code),)
    );
  }



  void snar(BuildContext context) async{
    var status = await Permission.camera.status;
        String barcodeScanRes;

        try {
          barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#ff6666', 'Cancel', false, ScanMode.QR);

        String id= barcodeScanRes.replaceFirst(AppAssets.qrURL, '');
        search(context,barcodeScanRes );


        } catch(ex){
          // log(ex.toString());
          barcodeScanRes = '';
        }

  }

  String destroy(String qr){
    String id= '1193565289/${DateTime.now()}';
    String input = "1193565289/2023-06-04 10:23:35.615947";
String output = id.replaceAll(' ', '/');


    String  laes = EncryptionUtils.encryptString(output) ;

    

       return '';




  }


  
}
