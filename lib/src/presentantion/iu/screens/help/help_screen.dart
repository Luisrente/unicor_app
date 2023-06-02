import 'package:flutter/material.dart';

import '../../widgets/export_widget.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 200,
        height: 500,
      ),
      bottomNavigationBar: AppNavBar(),
    );
  }
}