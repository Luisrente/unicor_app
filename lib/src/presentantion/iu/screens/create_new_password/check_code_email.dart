import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:pinput/pinput.dart';


import '../../../context/export_context.dart';
import '../../../router/router.dart';
import '../../../utils/show_alert.dart';
import '../../controllers/export_controllers.dart';
import '../../widgets/export_widget.dart';

class CheckCodeEmailPassword extends StatelessWidget {
   CheckCodeEmailPassword ({super.key});


   final AuthController controller = AuthController.initializeController();

   void send( BuildContext context , String code ) async {

    final result  = await controller.verifyCodepas( code);
    if(result){
     Get.toNamed(Routes.createNewPasswordView);
    }else{
     return mostrarAlerta(context, 'Error ',
    'Error en los datos');
    }
   }
   

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;


//     final defaultPinTheme = PinTheme(
//   width: 56,
//   height: 56,
//   textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
//   decoration: BoxDecoration(
//     border: Border.all(color: Color.fromARGB(255, 46, 50, 53)),
//     borderRadius: BorderRadius.circular(20),
//   ),
// );

// final focusedPinTheme = defaultPinTheme.copyDecorationWith(
//   border: Border.all(color: Color.fromARGB(51, 5, 122, 38)),
//   borderRadius: BorderRadius.circular(8),
// );

// final submittedPinTheme = defaultPinTheme.copyWith(
//   decoration: defaultPinTheme.decoration!.copyWith(
//     color: Color.fromARGB(233, 7, 119, 224),
//   ),
// );


    return Scaffold(
      appBar: CustomAppBarPhoto(),
      body: Container( 
            width: size.width,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                    children: [
                      const  SizedBox(height: 30),

                      const Text(
                       "!Ingresa!  el Token ",
                       style: TextStyle(
                         fontWeight: FontWeight.bold, 
                         fontSize: 20.0,
                       ),
                       textAlign: TextAlign.center,
                       maxLines: 2,
                       overflow: TextOverflow.ellipsis,
                      ),
                     const  SizedBox(height: 30),
                      Container(
                        child: Icon(Icons.email_outlined , size: 70,),
                      ),
                     const  SizedBox(height: 30),

                      ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: size.width * 0.85),
                      child: const  Text(
                       "Para completar la verificacion de tu cuenta , por favor ingresa el codigo de activacion de 4 digitos ",
                        textAlign: TextAlign.justify,
                        style:  TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 50),

//                     Pinput(
//   defaultPinTheme: defaultPinTheme,
//   focusedPinTheme: focusedPinTheme,
//   submittedPinTheme: submittedPinTheme,
//   validator: (s) {


//     int  length = s!.length;
//     if(length==4){
//       return 'completo';
//     }else{

//     }

//   },
//   pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//   showCursor: true,
//   onCompleted: (pin) {
//     send(context,pin);
//   },
// ),

const SizedBox(height: 70),

 Container(
            margin: const EdgeInsets.only(top: 15.0),
            child: TextButton(
              onPressed: () {
                // Get.offAllNamed(Routes.sendInstruction);
              },
              child: Text(
                "¿No ha llevo el codigo verificacion?",
                style: TextStyle(
                    color: AppAssets.blackColor,
                    decoration: TextDecoration.underline,
                    fontSize: 16.0, 
                    fontWeight: FontWeight.w300),
              )),
          ),

               
       ]
          )
          ),
    );
       
    
  }
}