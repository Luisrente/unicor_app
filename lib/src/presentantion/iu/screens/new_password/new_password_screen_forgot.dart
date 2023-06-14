import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../context/export_context.dart';
import '../../../router/router.dart';
import '../../../utils/show_alert.dart';
import '../../../utils/validators.dart';
import '../../controllers/export_controllers.dart';
import '../../widgets/export_widget.dart';

class NewPasswordScreenFortgot extends StatelessWidget {
   NewPasswordScreenFortgot({Key? key}) : super(key: key);

  final FocusNode _password1FocusNode = FocusNode();
  final FocusNode _password2FocusNode = FocusNode();

  final AuthController controller = AuthController.initializeController();
  final SharedController _sharedController = SharedController.initializeController();

  

  void update( BuildContext context ) async {
    final result  = await controller.changePasswordVer();
    if(result){
      Get.toNamed(Routes.splash);
    }else{
      return mostrarAlerta(context, 'Error',
    'Por favor verificar la inofrmacion');

    }
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
 const SizedBox(
              height: 16,
            ),

                Container(
              child: SvgPicture.asset(
                'assets/password.svg',
                width: 80,
                height: 120,
              ),
            ),

            const SizedBox(
              height: 16,
            ),
            Text(
              'Nueva contraseña',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Su nueva contraseña debe ser diferente de las utilizadas anteriormente.',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Contraseña',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 4,
            ),

          CustomTextFormField(
            placeHolder: 'Contraseña',
            obscurer: _sharedController.isObscured.value,
            focusNode: _password1FocusNode,
                        margin: const EdgeInsets.all( 20.0),

            constraints: const BoxConstraints(maxWidth: 300.0),
            onChangedFunction: (value){
              String? error = validateEmpty(value);
              _sharedController.setErrorMessage("password", error);
              if(error==null){
          controller.password1.value=value;
              }
            },
            isPasswordInput: true,
            suffixIconFunction: ()=>_sharedController.isObscured.value = !_sharedController.isObscured.value,
            onSubmittedFunction: (value){
              String? error = validateEmpty(value);
              _sharedController.setErrorMessage("password", error);
              if(error==null && _sharedController.findErrorMessage("email") == null){
                  // _sharedController.logIn();
              }
              FocusScope.of(context).unfocus();
            },
            inputType: TextInputType.text,
            fillColor: AppAssets.whiteColor,
            inputBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          ),

            
            const SizedBox(
              height: 16,
            ),
            Text(
              'Confirmar Contraseña',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 4,
            ),


          CustomTextFormField(
            placeHolder: 'Contraseña',
            obscurer: _sharedController.isObscured.value,
            focusNode: _password2FocusNode,
                        margin: const EdgeInsets.all( 20.0),
            constraints: const BoxConstraints(maxWidth: 300.0),
            onChangedFunction: (value){
              String? error = validateEmpty(value);
              _sharedController.setErrorMessage("password", error);
              if(error==null){
               controller.password2.value=value;
              }
            },
            isPasswordInput: true,
            suffixIconFunction: ()=>_sharedController.isObscured.value = !_sharedController.isObscured.value,
            onSubmittedFunction: (value){
              String? error = validateEmpty(value);
              _sharedController.setErrorMessage("password", error);
              if(error==null && _sharedController.findErrorMessage("email") == null){
                  // _sharedController.logIn();
              }
              FocusScope.of(context).unfocus();
            },
            inputType: TextInputType.text,
            fillColor: AppAssets.whiteColor,
            // inputBorder:
            //     OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          ),



          Obx(() => CustomButton(
                label: "Enviar ",
                 margin: const EdgeInsets.symmetric(vertical: 15.0),
                constraints: const BoxConstraints(maxWidth: 300.0),
                backgroundColor: AppAssets.primaryColor,
                onPressed: 
                (
                controller.password1.value == ''
                || controller.password2 == '' 
                || controller.password1.value != controller.password2.value
                ) 
                ? null :
                 () => update(context)),
                ),
          
          
          
      
            const SizedBox(
              height: 16,
            ),


            
            // Obx( (){
            // return CustomButton(
            //   label: "Resetablecer Contraseña",
            //    onPressed: ( 
            //     controller.pass1  ==  controller.pass2 ? 
            //         () async {
            //                 update(context);
            //                 }
            //       : null
            //      )  
            // );
            //  }
            // )

            // ElevatedButton(
            //   onPressed: () {
            //     Get.toNamed(Routes.login);
            //   },
            //   child: const Text(
            //     'Resetablecer Contraseña',
            //     style: TextStyle(fontSize: 20),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}