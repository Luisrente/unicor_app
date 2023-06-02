import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  final String title;
  final Widget? leadingWidget;
  final double? fontSize;
  const CustomAppBar({Key? key, 
  required this.title, 
  this.leadingWidget,
  this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leadingWidget??Container(),
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      elevation: 2,
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}