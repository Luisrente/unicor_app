import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../context/app_assets.dart';
import '../../../router/router.dart';
import '../../../utils/show_alert.dart';
import '../../../utils/validators.dart';
import '../../controllers/export_controllers.dart';
import '../../widgets/export_widget.dart';

// import '../check_email/check_email_view.dart';
// import '../util.dart';

class SendInstructionsView extends StatelessWidget {
  
  SendInstructionsView({Key? key}) : super(key: key);
  
  final FocusNode _emailFocusNode = FocusNode();

  final AuthController _authcontroller = AuthController.initializeController();
  final SharedController _sharedController = SharedController.initializeController();

    void send( BuildContext context ) async {
    final result  = await _authcontroller.sendPassword();
      Get.offAllNamed(Routes.checkCodeEmailPassword);
    // if(result){
    // }else{
    //  return mostrarAlerta(context, 'Error ',
    // 'Error en los datos');
    // }
   }

    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomAppBarPhoto(
        leadingWidget: TextButton(
          child:  Icon(Icons.chevron_left_outlined , size: 40),
          style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
          onPressed: () {
           Get.offNamed(Routes.login);
          },
        )  
        ),








     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [



    Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
  child: SvgPicture.asset(
    'assets/email.svg',
    width: 80,
    height: 150,
  ),
),
            Text(
              'Restablecer Contraseña',
              style: Theme.of(context).textTheme.headline4,
              
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Introduce la dirección de correo electrónico asociada a tu cuenta y te enviaremos un correo electrónico con instrucciones para restablecer tu contraseña',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Correo electronico',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 8,
            ),

                Obx(() {
                  return CustomTextFormField(
                  placeHolder: 'Correo',
                   errorText: _sharedController.findErrorMessage("email"),
                  focusNode: _emailFocusNode,
                  margin: const EdgeInsets.all( 20.0),
                  constraints: const BoxConstraints(maxWidth: 300.0),
                  onChangedFunction: (value) {
                  String? error = validateEmail(value);
                 _sharedController.setErrorMessage("email", '');
                 if(error==null){
                  _authcontroller.corre.value=value;

              }
            },
            onSubmittedFunction: (value){
              String? error = validateEmail(value);
              _sharedController.setErrorMessage("email", error);
            },
            inputType: TextInputType.text,
            fillColor: AppAssets.whiteColor,
            inputBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          );
          }
          ),
    
            const SizedBox(
              height: 16,
            ),
            

             CustomButton(
                label: "Enviar ",
                 margin: const EdgeInsets.symmetric(vertical: 15.0),
                constraints: const BoxConstraints(maxWidth: 300.0),
                backgroundColor: AppAssets.primaryColor,
                onPressed: (() => send(context)),
                ),

            // Row(
            //   children: [
            //     Expanded(
            //         child: ElevatedButton(
            //           onPressed: () {
            //             _authcontroller.corre.value=_authcontroller.enamilTextController.text;
            //             send(context);
            //           },
            //           child: const Text(
            //             'Enviar Instruciones',
            //             style: TextStyle(fontSize: 20),
            //           ),
            //         )),
            //   ],
            // )


          ],
        ),
      ),
    );
  }
}