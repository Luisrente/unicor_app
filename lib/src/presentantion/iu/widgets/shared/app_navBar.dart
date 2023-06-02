import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../context/app_assets.dart';
import '../../../router/router.dart';
import '../../screens/export_screen.dart';
import '../controllers/navBar_ctr.dart';

class AppNavBar extends StatelessWidget {

  final NavBarController _controller = NavBarController.initializeController();

  static const Map<int,String> routesMap = {
    1: Routes.home,
    2: Routes.notification,
    3: Routes.schedule,
    4: Routes.card
  };

  AppNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppAssets.blackColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildNavBarItem("Home", Icons.home, 1, ()=>navigateTo(1)),
          buildNavBarItem("Notification", Icons.notifications, 2, ()=>navigateTo(2)),
          buildNavBarItem("Calendario", Icons.calendar_month, 3, ()=>navigateTo(3)),
          buildNavBarItem("Carnet", Icons.account_circle_rounded, 4, ()=>navigateTo(4)),
        ],
      ),
    );
  }

  void navigateTo(int route){
    if(routesMap[route] != Get.currentRoute){
      Get.offNamed(routesMap[route]!);
    }
  }

  Widget buildNavBarItem(
      String label, IconData icon, int index, Function() onPressed) {
    return Obx((){
      return TextButton(
        style: ButtonStyle(
            padding:
                MaterialStateProperty.resolveWith((states) => EdgeInsets.zero),
            minimumSize:
                MaterialStateProperty.resolveWith((states) => const Size(80.0, 60.0)),
            maximumSize: MaterialStateProperty.resolveWith(
                (states) => const Size(95.0, 60.0))),
        onPressed: onPressed,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: AppAssets.whiteColor,
                size: 30.0,
              ),
              if(_controller.currentIndex.value == index)Text(
                label,
                style: TextStyle(
                    color: AppAssets.whiteColor,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300
                  ),
              )
            ],
          ),);
    });
  }
}
