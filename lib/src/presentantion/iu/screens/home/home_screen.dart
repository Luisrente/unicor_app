import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/models/export_model.dart';
import '../../../context/app_assets.dart';
import '../../controllers/export_controllers.dart';
import '../../widgets/export_widget.dart';

class HomeScreens extends StatelessWidget {
   HomeScreens({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
   final AuthController controller = AuthController.initializeController();

   controller.loadUser();
final User usuario = Get.arguments;
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
        child: Column(
          children: [
            if(usuario.verifi! == "verified")
            CustomIndenCard(user: usuario) 
          ]
          )
      ),
      // bottomNavigationBar: AppNavBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppAssets.primaryColor,
        onPressed: (){},
       
        ),
        drawer: 
                 AppDrawer(user: usuario)
                        
              
    );
  }
}



