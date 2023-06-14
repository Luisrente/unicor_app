import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicor_app/src/presentantion/iu/controllers/main_wrapper_controller.dart';
import 'package:unicor_app/src/presentantion/iu/screens/export_screen.dart';
import 'src/presentantion/iu/binding/main_binding.dart';
import 'src/presentantion/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CardUnicor',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      getPages: Pages.pages,
      initialBinding: MainBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: Get.put(MainWrapperController()).theme,
      // home: MainWrapper (),
    );
  }
}  
