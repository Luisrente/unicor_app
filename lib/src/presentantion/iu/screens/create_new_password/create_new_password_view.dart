import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../context/export_context.dart';
import '../../../utils/show_alert.dart';
import '../../../utils/validators.dart';
import '../../controllers/export_controllers.dart';
import '../../widgets/export_widget.dart';

class CreateNewPasswordView extends StatelessWidget {
   CreateNewPasswordView({Key? key}) : super(key: key);



  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _passwordFocusNode1 = FocusNode();

  final AuthController controller = AuthController.initializeController();
  final SharedController _sharedController = SharedController.initializeController();


  void update( BuildContext context ) async {
    // final result  = await controller.changePassword();
    // if(result){
    //   controller.routerRol();
    // }else{
    //   return mostrarAlerta(context, 'Login incorrecto',
    // 'Por favor complete los campos');
    // }
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appBar: AppBar(
      //   title: const Text(
      //     'Back',
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   leadingWidth: 30,
      //   leading: IconButton(
      //     icon: GestureDetector(
      //       onTap: (){
      //         Navigator.pop(context);
      //       },
      //       child: const Icon(
      //           Icons.arrow_back),
      //     ),
      //     onPressed: () {},
      //   ),
      // ),
            appBar: const CustomAppBar(title: "Mi cuenta"),



      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
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


            // SizedBox(
            //   height: 70,
            //   child: TextFormField(
            //     style: const TextStyle(color: Colors.black),
            //     obscureText: true,
            //     decoration: InputDecoration(
            //       helperText: 'Debe tener al menos 8 caracteres.',
            //       helperStyle: const TextStyle(fontSize: 14),
            //       suffixIcon: IconButton(
            //         icon: const Icon(Icons.visibility_off),
            //         onPressed: () {
            //           //change icon
            //         },
            //       ),
            //     ),
            //   ),
            // ),

             Obx(() =>


          CustomTextFormField(
            placeHolder: 'Contraseña',
            errorText: _sharedController.findErrorMessage("password"),
            obscurer: _sharedController.isObscured.value,
            focusNode: _passwordFocusNode,
                        margin: const EdgeInsets.all( 20.0),

            constraints: const BoxConstraints(maxWidth: 300.0),
            onChangedFunction: (value){
              String? error = validateEmpty(value);
              _sharedController.setErrorMessage("password", error);
              if(error==null){
                // controller.pass2.value=value;

                // _screenController.credentials.password = value;
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
          ),),

            
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

             Obx(() =>


          CustomTextFormField(
            placeHolder: 'Contraseña',
            errorText: _sharedController.findErrorMessage("password"),
            obscurer: _sharedController.isObscured.value,
            focusNode: _passwordFocusNode1,
                        margin: const EdgeInsets.all( 20.0),

            constraints: const BoxConstraints(maxWidth: 300.0),
            onChangedFunction: (value){
              String? error = validateEmpty(value);
              _sharedController.setErrorMessage("password", error);
              if(error==null){
// controller.pass1.value = value;
                // _screenController.credentials.password = value;
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
          ),),
            // SizedBox(
            //   height: 70,
            //   child: TextFormField(
            //     style: const TextStyle(color: Colors.black),
            //     obscureText: true,
            //     decoration: InputDecoration(
            //       helperText: 'Ambas contraseñas deben coincidir.',
            //       helperStyle: const TextStyle(fontSize: 14),
            //       suffixIcon: IconButton(
            //         icon: const Icon(Icons.visibility_off),
            //         onPressed: () {
            //           //change icon
            //         },
            //       ),
            //     ),
            //   ),
            // ),
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