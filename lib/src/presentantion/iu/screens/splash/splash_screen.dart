import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/export_controllers.dart';


class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/logo_background.png'))
    );
  }
}