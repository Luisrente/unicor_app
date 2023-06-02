import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../router/router.dart';
import '../../../utils/show_alert.dart';
import '../../controllers/export_controllers.dart';
import '../../widgets/export_widget.dart';

// import '../check_email/check_email_view.dart';
// import '../util.dart';

class SendInstructionsView extends StatelessWidget {
  
  SendInstructionsView({Key? key}) : super(key: key);
  

  final AuthController controller = AuthController.initializeController();
  // final HomeController _controllerUser = HomeController.initializeController();

    void send( BuildContext context ) async {
    final result  = await controller.sendPassword();
    if(result){
      Get.offAllNamed(Routes.checkEmailView);
    }else{
     return mostrarAlerta(context, 'Error ',
    'Error en los datos');
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
  
      // appBar: AppBar(
      //   title: const Text(
      //     'Back',
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   leadingWidth: 30,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Get.back();
      //     },
      //   ),
      //   actions: const [
      //     Padding(
      //       padding: EdgeInsets.only(right: 16.0),
      //       child: Icon(Icons.help_outline),
      //     )
      //   ],
      //   backgroundColor: Colors.transparent,
      //       elevation: 0,
      //       iconTheme: IconThemeData(color: Colors.black),
      //   // primaryColor: const Color(0xff7b39ed),
      //   // primarySwatch: primarySwatch,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
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
            SizedBox(
              height: 50,
              child: TextFormField(
                style:
                const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              // controller: controller.enamilTextController,

              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        controller.corre.value=controller.enamilTextController.text;
                        send(context);
                      },
                      child: const Text(
                        'Enviar Instruciones',
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}