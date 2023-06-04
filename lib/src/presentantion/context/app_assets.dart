import 'package:flutter/material.dart';
class AppAssets {
  static AppAssets? _singleton;
  factory AppAssets() => _singleton ??= AppAssets._();

  AppAssets._();


  static String url = 'http://3.85.53.75:3000';

  static String qrURL = 'https://3.85.53.75:3000';
  static String keyString = '1a3f8c7e9b2d6f54e0a1b3c5d7e9f0a1';

  static String whiteLogo = 'assets/logo_white.png';
  static String colorLogo = 'assets/logo_color.png';
  static String noPhoto= 'assets/no_photo.jpeg';
  static String firstOnBoardingImage= 'assets/first_onBoarding_image.png';
  static String secondOnBoardingImage= 'assets/second_onBoarding_image.png';
  static String thirdOnBoardingImage= 'assets/third_onBoarding_image.png';
  static String loginBackgroundImage = 'assets/logo_background.png';

  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;

  static Color primaryColor = const Color(0XFF03A851);
  static Color secondaryColor = const Color(0XFF22593C);
  static Color tertiaryColor = const Color(0xFF006EC0);

  // static Map<UserGroup,String> userRoles = {
  //   UserGroup.OPERATORS:"Operador",
  //   UserGroup.CERTIFIERS:"Certificador",
  //   UserGroup.ADMINS:"Administrador",
  //   UserGroup.CLIENTS:"Cliente",
  // };
  // static Map<UserGroup,UserGroup> userRoles = {
  //   UserGroup.OPERATORS:UserGroup.OPERATORS,
  //   UserGroup.CERTIFIERS:UserGroup.CERTIFIERS,
  //   UserGroup.ADMINS:UserGroup.ADMINS,
  //   UserGroup.CLIENTS:UserGroup.CLIENTS,
  // };
}
