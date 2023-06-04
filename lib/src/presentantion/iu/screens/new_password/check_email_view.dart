import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../router/router.dart';
import '../../widgets/export_widget.dart';
import 'new_password_screen.dart';
// import '../util.dart';

class CheckEmailView extends StatelessWidget {

  const CheckEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const CustomAppBar(title: "Mi cuenta"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.mail_outline_rounded,
                      size: 100,
                      color:  Color(0xFF006EC0),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Revisa el correo',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                          'Hemos enviado las instrucciones de recuperación de la contraseña a su correo electrónico.',
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.admin);
                    },
                    child: const Text(
                      'Validar',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.login);
                  },
                  child: Text(
                    'Omitir, lo confirmaré más tarde',
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('¿No has recibido el correo electrónico? '),
                                    const Text('Compruebe su filtro de spam'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Text('o'),
                    TextButton(
                      onPressed: () {},
                      child: const Text('vuelve a intentar'),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
