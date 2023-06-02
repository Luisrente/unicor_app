import 'package:get/get.dart';
import '../iu/binding/export_binding.dart';
import '../iu/screens/export_screen.dart';


class Routes{
  static const String splash = '/splash';
  static const String login = '/login';
  static const String registerCounte = '/register';
  static const String dasboard = '/dasboard';
  static const String home = '/home';
  static const String help = '/help';
  static const String card = '/card';
  static const String notification = '/notification';
  static const String onBoarding = '/onboarding';
  static const String schedule = '/schedule';
  static const String uploadPhoto = '/upload';
  static const String admin = '/admin';
  static const String adminDetails = '/adminDetails';

  static const String verifyCode = '/verifyCode';


  //PASSWORD
  static const String checkCodeEmailPassword = '/checkCodeEmailPassword';
  static const String checkEmailView = '/checkEmailView';
  static const String createNewPasswordView = '/createNewPasswordView';
  static const String sendInstructionsView = '/sendInstructionsView';

}


class Pages{

static final pages = [
    GetPage(name: Routes.home, page: (() =>   HomeScreens()),bindings: [AuthBinding(),MainBinding()]),
    GetPage(name: Routes.login, page: (() =>   LoginScreen()),bindings: [AuthBinding(),MainBinding()] ),
    GetPage(name: Routes.help, page: (() =>  const  HelpScreen())),
    GetPage(name: Routes.card, page: (() =>    CardScreen())),
    GetPage(name: Routes.notification, page: (() =>  const  NotificationScreen())),
    GetPage(name: Routes.splash, page: (() =>  const  SplashScreen()),binding: SplashBinding()),
    GetPage(name: Routes.onBoarding, page: (() =>  OnBoardingScreen())),
    GetPage(name: Routes.schedule, page: (() =>  ScheduleScreen())),
    GetPage(name: Routes.uploadPhoto, page: (() =>  UploadPhotoScreen())),

    GetPage(name: Routes.admin, page: (() =>   AdminScreen())),
    GetPage(name: Routes.adminDetails, page: (() => AdminDetails())),


    //PASSWORD
    GetPage(name: Routes.adminDetails, page: (() => CheckCodeEmailPassword())),
    GetPage(name: Routes.adminDetails, page: (() => CheckEmailView())),
    GetPage(name: Routes.adminDetails, page: (() => CreateNewPasswordView())),
    GetPage(name: Routes.sendInstructionsView, page: (() => SendInstructionsView())),


    
];


}