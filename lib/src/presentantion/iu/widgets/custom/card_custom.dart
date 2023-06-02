import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CardCustom extends StatelessWidget {



  const CardCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      color: Colors.green,
      margin:  const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
    );
  }
}