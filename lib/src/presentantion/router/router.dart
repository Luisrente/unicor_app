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
  static const String admin = '/admin';
  static const String adminDetails = '/adminDetails';

  static const String verifyCode = '/verifyCode';

  static const String uploadPhoto = '/upload';
  static const String uploadProfile = '/uploadProfile';



  static const String account = '/account';

  //PASSWORD
  static const String checkCodeEmailPassword = '/checkCodeEmailPassword';
  static const String newPassword = '/newPassword';
  static const String sendInstructionsView = '/sendInstructionsView';

}


class Pages{

static final pages = [
    GetPage(name: Routes.home, page: (() =>   HomeScreens()),bindings: [MainBinding(),AuthBinding(),AccountBinding()]),
    GetPage(name: Routes.account, page: (() =>   AccountScreen()),bindings: [MainBinding(),AuthBinding(),AccountBinding()]),
    GetPage(name: Routes.login, page: (() =>   LoginScreen()),bindings: [MainBinding(),AuthBinding(),AccountBinding()]),
    GetPage(name: Routes.help, page: (() =>  const  HelpScreen())),
    GetPage(name: Routes.card, page: (() =>    CardScreen())),
    GetPage(name: Routes.notification, page: (() =>  const  NotificationScreen())),
    GetPage(name: Routes.splash, page: (() =>  const  SplashScreen()),binding: SplashBinding()),
    GetPage(name: Routes.onBoarding, page: (() =>  OnBoardingScreen())),
    GetPage(name: Routes.schedule, page: (() =>  ScheduleScreen())),
    
    GetPage(name: Routes.admin, page: (() =>   AdminScreen()),bindings: [MainBinding(),ControlBinding()]),
    GetPage(name: Routes.adminDetails, page: (() => AdminDetails())),


    GetPage(name: Routes.uploadPhoto, page: (() =>  UploadPhotoDocScreen())),
    //PASSWORD
    GetPage(name: Routes.checkCodeEmailPassword, page: (() => CheckCodeEmailPassword())),
    GetPage(name: Routes.newPassword, page: (() => NewPasswordScreen())),
    GetPage(name: Routes.sendInstructionsView, page: (() => SendInstructionsView()), bindings: [AuthBinding(),MainBinding()]),


    
];


}