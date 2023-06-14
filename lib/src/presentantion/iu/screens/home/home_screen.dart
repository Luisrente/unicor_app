import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../domain/models/export_model.dart';
import '../../../context/app_assets.dart';
import '../../../router/router.dart';
import '../../controllers/export_controllers.dart';
import '../../widgets/export_widget.dart';

class HomeScreens extends StatefulWidget {
   HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final AccountController  _accountController =  AccountController.initializeController();

Future<void>  refresh() async{
  final user =await _accountController.loadUserRefresh();
  log('${user!.status}');
 return Future<void>.delayed(const Duration(seconds: 3));
 
    }

  @override
  Widget build(BuildContext context) {


    
  return Scaffold(
        key: scaffoldKey,
        appBar: CustomAppBarPhoto(
  
        leadingWidget: TextButton(
          child: Icon(Icons.menu),
          style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
          onPressed: () {
           scaffoldKey.currentState!.openDrawer();
          },
        ) 

        ),
      body: RefreshIndicator(
        onRefresh: ()=>refresh(),
        child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Body(accountController: _accountController),
            ],
          )
          ),
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

class Body extends StatelessWidget {
  const Body({
    super.key,
    required AccountController accountController,
  }) : _accountController = accountController;

  final AccountController _accountController;
 
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
             Obx(             
              ()  {
                 final user = _accountController.user.value;
                  if (user.status == "VERIFICADO") {
                    return CustomIndenCard(user: user);
                  } else if (user.status == "PENDIENTE") {
                    return  const PendingWidget();
                  } else  if (user.status == "RECHAZADO") {
                    return  const RechazadoWidget();
                  } else  if (user.status == "ACTIVO") {
                    return  const Statuscation();
                  }
                  return Container();
             }          
             )
        ] 
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
                  padding: const EdgeInsets.only(top: 70, bottom: 40),
                  child: SvgPicture.asset(
                  'assets/pending.svg',
                  width: 80,
                   height: 200,
                 ),
),


 Container(
  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    width: double.infinity,

   child: const Text(
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

class RechazadoWidget extends StatelessWidget {
  const RechazadoWidget({super.key});

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
      'Informacion incorrecta',
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
                  padding: const EdgeInsets.only(top: 70, bottom: 40),
                  child: SvgPicture.asset(
                  'assets/incorrecto.svg',
                  width: 80,
                   height: 200,
                 ),
),


 Container(
  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    width: double.infinity,

   child: const Text(
                  "Lamentablemente, no hemos logrado verificar tu identidad debido a la información incorrecta proporcionada. Te pedimos amablemente que subas unas nuevas fotos más claras, donde se pueda apreciar tu rostro de manera más precisa. ¡Gracias",
                  style: TextStyle(
                    
                      fontSize: 18.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300),
                            textAlign: TextAlign.justify,

                ),
 ),


 CustomButton(label: "Activa tu carde" , onPressed: (){
          Get.offAllNamed(Routes.uploadPhoto );
          })
        

      ],
    );
  }
}






class Statuscation extends StatelessWidget {
  const Statuscation({
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
                  padding: const EdgeInsets.only(top: 70, bottom: 40),
                  child: SvgPicture.asset(
                  'assets/cart.svg',
                  width: 80,
                   height: 200,
                 ),
),

 Container(
  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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



