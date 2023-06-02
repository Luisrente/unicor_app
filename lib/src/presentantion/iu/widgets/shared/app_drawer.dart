import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../domain/models/export_model.dart';
import '../../../context/export_context.dart';
import '../../../router/router.dart';
import '../../controllers/export_controllers.dart';
import '../export_widget.dart';

class AppDrawer extends StatelessWidget {


  final User user ;


  AppDrawer({Key? key, required this.user}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
       final AuthController controller = AuthController.initializeController();

    return Drawer(
     child: Container(
      margin: const EdgeInsets.only(top: 30.0),
      child: 
      Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
     Container(
      color: Colors.green[700],
      width: double.infinity,
      height: 220,
      padding: EdgeInsets.only(top: 20.0),
      // decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //           begin: Alignment.centerLeft,
      //           end: Alignment.topRight,
      //           colors: [
      //             AppAssets.primaryColor,
      //             AppAssets.tertiaryColor,
      //           ]),
      //     ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       
           buildAccountDetail(size,user)
          
          
        ],
      ),
    ),

          Column(
            children: [

              // ListTile(
              //   title: Text(
              //     "Menu",
              //     style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 20.0,
              //         color: AppAssets.blackColor),
              //   ),
              //   trailing: IconButton(
              //       onPressed: () => Get.back(),
              //       icon: Icon(
              //         Icons.close,
              //         color: AppAssets.blackColor,
              //       )),
              // ),
              // Divider(
              //   thickness: 1,
              //   color: AppAssets.blackColor,
              // ),
              // if (_sessionController.isClientUser())


                  //  Container(
                  //   color: AppAssets.primaryColor,
                  //    child: Padding(
                  //         padding: const EdgeInsets.only(
                  //             right: 25, left: 25, top: 30, bottom: 20),
                  //         child: Image.asset('assets/logo_background.png',
                  //             alignment: Alignment.center),
                  //       ),
                  //  ),



               buildTileA(Icons.help, "Ayuda"),

              if (user.rol == "USER_ROLE")
               buildTile(Icons.more, "Mi cuenta ",
                    () => Get.offNamed(Routes.login)),
            ],
          ),
          CustomButton(
              label: "Cerrar sesión",
              borderRadius: 10.0,
              customBorder:  BorderSide(color: AppAssets.secondaryColor),
              backgroundColor: AppAssets.whiteColor,
              labelStyle: TextStyle(color: AppAssets.secondaryColor),
              onPressed: ( )async{
                 await controller.logout();
              }),
        ],
      ),
    ));
  }

  Widget buildTile(IconData icon, String label, Function() onPressed) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 18.0,
            color: AppAssets.blackColor),
      ),
      leading: Icon(
        icon,
        color: AppAssets.blackColor,
        size: 25.0,
      ),
      onTap: onPressed,
    );
  }

  Widget buildTileA(IconData icon, String label) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 18.0,
            color: AppAssets.blackColor),
      ),
      leading: Icon(
        icon,
        color: AppAssets.blackColor,
        size: 25.0,
      ),
      onTap: (){},
    );
  }

    Widget buildAccountDetail(Size size , User user ) {
    String userPhotoUrl = "";
    // if (currentUserData.profileImg != null) {
    //   userPhotoUrl = currentUserData.profileImg!.url!;
    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          constraints: const BoxConstraints(maxWidth: 100.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: user.img!.isNotEmpty
                ? Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                  shape: BoxShape.circle,),
                  child: FadeInImage(
                      fit: BoxFit.cover,
                      placeholder: AssetImage(AppAssets.noPhoto),
                      image: NetworkImage(user.img!)),
                )
                : Image.asset(
                    AppAssets.noPhoto,
                    fit: BoxFit.cover,
                  ),
          ),
        ),

        TitleText("${user.nombre1} ${user.apellido1}",
            margin: EdgeInsets.zero, alignment: Alignment.center),

        Text(
          "${user.correo}",
          style: const TextStyle(
              fontSize: 18.0,
              color: Colors.grey,
              fontWeight: FontWeight.w300),
        ),
      ],
    );
  }




}
