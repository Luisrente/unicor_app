import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../domain/models/export_model.dart';
import '../../../context/app_assets.dart';
import '../../../router/router.dart';
import '../../controllers/export_controllers.dart';
import '../../widgets/export_widget.dart';

class HomeScreens extends StatelessWidget {
   HomeScreens({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final AccountController  _accountController =  AccountController.initializeController();

  @override
  Widget build(BuildContext context) {
  return Scaffold(
        key: scaffoldKey,
        appBar: CustomAppBarPhoto(
  
        leadingWidget: TextButton(
          child:   Icon(Icons.menu),
          style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
          onPressed: () {
           scaffoldKey.currentState!.openDrawer();
          },
        ) 

        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
               Obx(             
                () {
                   final user = _accountController.user.value;
                    if (user.verifi == "verified") {
                      return CustomIndenCard(user: user);
                    } else if (user.verifi == "pending") {
                      return  const PendingWidget();
                    } else {
                      return  const Verification();
                    }
               }          
               )
          ]
          )
      ),
             drawer: Obx(             
                () {
                  final user = _accountController.user.value;
                  return AppDrawer(user: user);
               }          
               ),

      // bottomNavigationBar: AppNavBar(),
      
    );
  }
}


class PendingWidget extends StatelessWidget {
  const PendingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [


      

Container(
  width: double.infinity,
  padding: const EdgeInsets.symmetric(vertical: 60), // Establece el ancho máximo del texto
  child: const Align(
    alignment: Alignment.center,
    child: Text(
      'Verificando informacion',
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold
        // Añade cualquier otra propiedad de estilo que desees
      ),
    ),
  ),
),


                Container(
                  padding: EdgeInsets.only(top: 70, bottom: 40),
                  child: SvgPicture.asset(
                  'assets/pending.svg',
                  width: 80,
                   height: 200,
                 ),
),


 Container(
  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    width: double.infinity,

   child: Text(
                  "Mi carnet digital activo me brinda la oportunidad de llevar toda mi información esencial en un dispositivo y acceder a ella cuando lo necesite.",
                  style: TextStyle(
                    
                      fontSize: 18.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300),
                            textAlign: TextAlign.justify,

                ),
 ),

      ],
    );
  }
}






class Verification extends StatelessWidget {
  const Verification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          Container(
  width: double.infinity,
  padding: const EdgeInsets.symmetric(vertical: 60), // Establece el ancho máximo del texto
  child: const Align(
    alignment: Alignment.center,
    child: Text(
      'Carnet digital',
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold
        // Añade cualquier otra propiedad de estilo que desees
      ),
    ),
  ),
),


                Container(
                  padding: EdgeInsets.only(top: 70, bottom: 40),
                  child: SvgPicture.asset(
                  'assets/cart.svg',
                  width: 80,
                   height: 200,
                 ),
),

 Container(
  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: double.infinity,

   child:const Text(
                  "El carnet digital  activo  brinda  la  oportunidad  de llevar  toda  la  información  esencial  en  un  dispositivo y acceder a ella cuando lo necesite.",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300),
                ),
 ),
          CustomButton(label: "Activa tu carde" , onPressed: (){
          Get.offAllNamed(Routes.uploadPhoto );
          })
        ]),
    );
  }
}



