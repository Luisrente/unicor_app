import 'package:flutter/material.dart';
import '../../../context/export_context.dart';
import '../../widgets/export_widget.dart';

class OnBoardingScreen extends StatelessWidget {

  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SliderWidget(
        pagePadding: EdgeInsets.zero,
        secundaryColor: Colors.white54,
        hasDots: true,
        slides: [
          buildScreen(
              size,
              AppAssets.firstOnBoardingImage,
              "Bienvenido a  Unicordoba",
              "Aplicación de gestión y control"),

          buildScreen(
              size,
              AppAssets.secondOnBoardingImage,
              "Unicordoba",
              "Aplicación de gestión y control"),

          buildScreen(
              size,
              AppAssets.thirdOnBoardingImage,
              "Opción de “Ayuda",
              "En el menú de la aplicación encontraras una pagina de ayuda para guiarte en todo el proceso."),
        ],
      ),
    );
  }


  Widget buildScreen(Size size, String image, String title, String message) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.topRight,
                colors: [
                  AppAssets.primaryColor,
                  AppAssets.tertiaryColor,
                ]),
          ),
        ),
        
        Container(
          decoration: const BoxDecoration(color: Colors.black38),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: size.height * 0.5,
              width: size.width,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: size.width,
              constraints: BoxConstraints(maxHeight: size.height * 0.4),
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                        color: AppAssets.whiteColor),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 25.0, left: 15.0, right: 15.0),
                    child: Text(message,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 18.0,
                            color: AppAssets.whiteColor)),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
