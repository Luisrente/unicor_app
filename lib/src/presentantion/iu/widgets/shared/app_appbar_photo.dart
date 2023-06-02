import 'package:flutter/material.dart';

class CustomAppBarPhoto extends StatelessWidget with PreferredSizeWidget{
  final String? title;
  final Widget? leadingWidget;
  final double? fontSize;
  const CustomAppBarPhoto({Key? key, 
  this.title, 
  this.leadingWidget,
  this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leadingWidget??Container(),
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      title: Container(
          child: Image.asset('assets/logo_background.png',
          width: 150,
          height: 70,
          alignment: Alignment.center),
        ),
              
      centerTitle: true,
      elevation: 2,
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}