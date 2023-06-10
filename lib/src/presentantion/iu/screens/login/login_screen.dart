


import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../context/export_context.dart';
import '../../../router/router.dart';
import '../../../utils/show_alert.dart';
import '../../../utils/validators.dart';
import '../../controllers/export_controllers.dart';
import '../../widgets/export_widget.dart';

class LoginScreen extends StatelessWidget  {

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();


  final SharedController _sharedController = SharedController.initializeController();
  final AuthController controller = AuthController.initializeController();
//  final LanguegeCrontroller _languageController = LanguegeCrontroller.initializeController();


   LoginScreen({super.key});


   void login( BuildContext context ) async {
    final result  = await controller.login();
    if(result){
      controller.routerRol();
    }else{
      return mostrarAlerta(context, 'Login incorrecto',
    'Por favor complete los campos');
    }
   }


  // saveStatusLanguage(String locale) async {
  //   SharedPreferences prefers = await SharedPreferences.getInstance();
  //   await prefers.setString('locale', locale);
  //   _languageController.status.value = locale;
  // }
  //    AppLanguage l10n = AppLanguage();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Stack(
              children: [
                
                Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Container(
                      margin: EdgeInsets.only(top: 80),
                      child: Image.asset(
                      AppAssets.loginBackgroundImage,
                       width: 300.0,
                       height: 100,
                       ),
                    ),
                    
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Column(
                        children: [

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
                  controller.corre.value=value;      
              }
            },
            onSubmittedFunction: (value){
              String? error = validateEmail(value);
              _sharedController.setErrorMessage("email", error);
              FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
            inputType: TextInputType.text,
            fillColor: AppAssets.whiteColor,
            inputBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          );
          }
          ),

                    Obx(() => CustomTextFormField(
             icon: Icons.lock_outline,
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
                controller.password.value=value;
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
                                      
                    GestureDetector(
            child: Text( "¿Olvidates tu contraseña?", style: TextStyle( color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300 ))  ,
            onTap: () {
              Get.toNamed(Routes.sendInstructionsView);
            },
          ),

                    CustomButton(
                label: "Iniciar Sesión",
                 margin: const EdgeInsets.symmetric(vertical: 15.0),
                constraints: const BoxConstraints(maxWidth: 300.0),
                backgroundColor: AppAssets.primaryColor,
                onPressed: (() => login(context)),
                ),
                
            // ObxValue(
            //   (p0) {
            // print(p0);
            // return 
            // CustomSeleectLanguage(
            //   value: 'ENGLISH',
            //   childrens: [

            //     DropdownMenuItem(
            //       value: 'en',
            //       child: Row(
            //         children: [
            //           const Padding(
            //               padding: EdgeInsets.only(right: 10),
            //               child: Image(image: AssetImage('assets/ingles.png'))),
            //           Text(
            //             'ENGLISH',
            //             style: const TextStyle(color: Colors.grey),
            //           ),
            //         ],
            //       ),
            //     ),
                // DropdownMenuItem(
                //   value: 'es',
                //   child: Row(
                //     children: [
                //       const Padding(
                //           padding: EdgeInsets.only(right: 10),
                //           child:
                //               Image(image: AssetImage('assets/español.png'))),
                //       Text(
                //         "l10n.languageSpanish",
                //         style: const TextStyle(color: Colors.grey),
                //       ),
                //     ],
                //   ),
                // )
          //     ],
          //     onChangedF: (newValue) {
          //       // saveStatusLanguage(newValue);
          //     },

          //   );
          // }, _languageController.status),
                        ],
                      ),
                    ),
                     
                    // const Labels(
                    //   ruta: 'register',
                    //   titulo: '¿Eres visitante ? ¿No tienes cuenta?',
                    //   subTitulo: 'Crea una ahora!',
                    // ),
                    const Text(
                      'Términos y condiciones de uso',
                      style: TextStyle(fontWeight: FontWeight.w200),
                    ),
                    const Text(
                      '2023',
                      style: TextStyle(fontWeight: FontWeight.w200),
                    ),

                  ],
                ),
              ),
              
              Positioned.fill(
                child:Obx((){
                  if (controller.loginState.value == LoginState.loading){
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
              
              ]
            ),
          ),
        ));
  }
}

 Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        top: 70.0,
      ),
      child: Column(
        children: [

          SizedBox(
            height: 50,
          ),
          Image.asset(
            AppAssets.loginBackgroundImage,
            width: 300.0,
          ),
          SizedBox( height: 20,),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: Text(
              "Bienvenido a la aplicacion a la Gobernacion de Cordoba",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  color: AppAssets.blackColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 15.0),
            ),
          ),
          TitleText(
            "Inicio de sesión",
            margin: const EdgeInsets.only(top: 70.0),
            textStyle: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppAssets.blackColor),
          ),
      
          CustomTextFormField(
         placeHolder: 'Correo electrónico',
         // errorText: _sharedController.findErrorMessage("email"),
         // focusNode: _emailFocusNode,
         margin: const EdgeInsets.only(top: 20.0),
         constraints: const BoxConstraints(maxWidth: 300.0),
         onChangedFunction: (value) {
              // String? error = validateEmail(value);
              // _sharedController.setErrorMessage("email", error);
              // if(error==null){
              //   _screenController.credentials.email = value;
              // }
            },
            onSubmittedFunction: (value){
              // String? error = validateEmail(value);
              // _sharedController.setErrorMessage("email", error);

              // FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
            inputType: TextInputType.text,
            fillColor: AppAssets.whiteColor,
            inputBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
          
          CustomTextFormField(
            placeHolder: 'Contraseña',
            // errorText: _sharedController.findErrorMessage("password"),
            // obscurer: _screenController.isObscured.value,
            // focusNode: _passwordFocusNode,
            margin: const EdgeInsets.only(top: 10.0),
            constraints: const BoxConstraints(maxWidth: 300.0),
            onChangedFunction: (value){
              // String? error = validateEmpty(value);
              // _sharedController.setErrorMessage("password", error);
              // if(error==null){
              //   _screenController.credentials.password = value;
              // }
            },
            isPasswordInput: true,
            // suffixIconFunction: ()=>_screenController.isObscured.value = !_screenController.isObscured.value,
            onSubmittedFunction: (value){
              // String? error = validateEmpty(value);
              // _sharedController.setErrorMessage("password", error);
              // if(error==null && _sharedController.findErrorMessage("email") == null){
              //     _screenController.logIn();
              // }
              FocusScope.of(context).unfocus();
            },
            inputType: TextInputType.text,
            fillColor: AppAssets.whiteColor,
            inputBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
          
          Container(
            margin: const EdgeInsets.only(top: 15.0),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "¿Haz olvidado tu contraseña?",
                style: TextStyle(
                    color: AppAssets.blackColor,
                    decoration: TextDecoration.underline,
                    fontSize: 16.0, 
                    fontWeight: FontWeight.w300),
              )),
          ),

         
            CustomButton(
              label: "Iniciar Sesión",
              margin: const EdgeInsets.symmetric(vertical: 15.0),
              constraints: const BoxConstraints(maxWidth: 300.0),
              backgroundColor: AppAssets.primaryColor,
              onPressed: (){},
              // onPressed:(_sharedController.findErrorMessage("email") != null||_sharedController.findErrorMessage("password") != null)?null:()=>_screenController.logIn()
              ),

              Positioned(
                bottom: 20,
                child: Text('Términos y condiciones de uso', style: TextStyle( fontWeight: FontWeight.w200 )))
          
          
        ],
      ),
    ));
  }

  Widget buildBackground(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    AppAssets.primaryColor,
                    AppAssets.primaryColor,
                    AppAssets.tertiaryColor,
                  ]),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(AppAssets.loginBackgroundImage))),
        ),
        Container(
          decoration: const BoxDecoration(color: Colors.black38),
        )
      ],
    );
  }