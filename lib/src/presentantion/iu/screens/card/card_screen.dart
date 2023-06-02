

import 'package:flutter/material.dart';
import 'package:unicor_app/src/domain/models/export_model.dart';

import '../../../context/export_context.dart';
import '../../controllers/export_controllers.dart';
import '../../widgets/export_widget.dart';


import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CardScreen extends GetWidget<HomeController> {
  
   CardScreen({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    // Obtener los parámetros de consulta (query parameters) de la URL
    //  String? nombre = uri.queryParameters['id'];
 

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
       body: SingleChildScrollView(
         child: Container(
           child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                    // CustomIndenCard(user: user)
            ],
           ),
         ),
       ),

            //  bottomNavigationBar: AppNavBar(),

    );
  }
}

class NavigatorBar extends StatelessWidget {
  final int index;

  final ValueChanged<int> onIndexSelected;

  const NavigatorBar({super.key, required this.index, required this.onIndexSelected});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 10),
      child: DecoratedBox(
        decoration : BoxDecoration(
          color: Color.fromARGB(31, 247, 245, 245),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Material(
               child: IconButton(
                icon: Icon(Icons.home,size: 35.0),
                onPressed:() => onIndexSelected(0)
                  ),
             ),
             Material(
               child: IconButton(
                icon: Icon(Icons.help, size: 35.0,),
                onPressed:() => onIndexSelected(1)
                         ),
             ),

             Material(
               child: IconButton(
                onPressed: () => onIndexSelected(2) , 
                icon: Icon(Icons.help, size: 35.0,)
                         ),
             ),

             IconButton(
              onPressed: () => onIndexSelected(3),
              color: AppAssets.secondaryColor, 
              icon: Icon(Icons.account_circle_rounded,size: 35.0),
                       ),
       
            ]
          ),
        ),
      )
    );
  }
}