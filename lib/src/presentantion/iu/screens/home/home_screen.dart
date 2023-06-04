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


        const  Padding(
                 padding:  EdgeInsets.only(top: 50),
                 child: TitleText("Verificando informacion",
                 textStyle:TextStyle( fontSize: 30 , fontWeight: FontWeight.bold),
                  margin: EdgeInsets.zero, alignment: Alignment.topLeft
                  
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
  padding: EdgeInsets.symmetric(vertical: 10),
   child: Text(
                  "Mi carnet digital activo me brinda la oportunidad de llevar toda mi información esencial en un dispositivo y acceder a ella cuando lo necesite.",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300),
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
               const  Padding(
                 padding:  EdgeInsets.only(top: 50),
                 child: TitleText("Carnet digital",
                 textStyle:TextStyle( fontSize: 30 , fontWeight: FontWeight.bold),
                  margin: EdgeInsets.zero, alignment: Alignment.topLeft
                  
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
  padding: EdgeInsets.symmetric(vertical: 10),
   child: Text(
                  "Mi carnet digital activo me brinda la oportunidad de llevar toda mi información esencial en un dispositivo y acceder a ella cuando lo necesite.",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300),
                ),
 ),
          CustomButton(label: "Activa tu cardes" , onPressed: (){
          Get.offAllNamed(Routes.uploadPhoto );
          })
        ]),
    );
  }
}



