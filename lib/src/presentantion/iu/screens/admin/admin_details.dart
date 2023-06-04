
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';


import '../../../../domain/models/export_model.dart';
import '../../../router/router.dart';
import '../../controllers/control_controller.dart';
import '../../widgets/export_widget.dart';
import '../../controllers/export_controllers.dart';

class AdminDetails extends StatelessWidget {
  
   AdminDetails({super.key});
   

  @override
  Widget build(BuildContext context) {
  final ControlController controller = ControlController.initializeController();

    return Scaffold(
       appBar:  const CustomAppBarPhoto(),
      body: Column(
        children: [
          Obx(() => CustomIndenCard(user: controller.userSearch.value)),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                            label: "Cancelar",
                   margin: const EdgeInsets.symmetric(vertical: 15.0),
                  constraints: const BoxConstraints(maxWidth: 140.0),
                  backgroundColor: Colors.red,
                  onPressed: (){
                  Get.toNamed(Routes.admin);
                  }
                  ),
                CustomButton(
                            label: "Aceptar",
                   margin: const EdgeInsets.symmetric(vertical: 15.0),
                  constraints: const BoxConstraints(maxWidth: 140.0),
                  backgroundColor: Colors.green,
                  onPressed: (){
                      Get.toNamed(Routes.admin);
                  }
                  )
              ],
            ),
          )
        ],
      )

    );
  }
}