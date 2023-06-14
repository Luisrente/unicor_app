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
     children: [
     Container(
      color: Color.fromARGB(255, 232, 235, 232),
      width: double.infinity,
      height: 280,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           buildAccountDetail(size,user)
          
        ],
      ),
    ),

          Column(
            children: [

               buildTileA(Icons.help, "Ayuda"),

            
               buildTile(Icons.more, "Mi cuenta ",
                    () => Get.offNamed(Routes.account)),


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
    // if (currentUserData.profileprofilePicture != null) {
    //   userPhotoUrl = currentUserData.profileprofilePicture!.url!;
    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          constraints: const BoxConstraints(maxWidth: 160.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color.fromARGB(255, 50, 126, 15),
                    width: 6.0,
                  ),
                ),
                child: ClipOval(
                  child: Container(
                    child: user.identificationPicture!.isNotEmpty
                      ? FadeInImage(
                          fit: BoxFit.cover,
                          placeholder: AssetImage(AppAssets.noPhoto),
                          image: NetworkImage(user.identificationPicture!),
                        )
                      : Image.asset(
                          AppAssets.noPhoto,
                          fit: BoxFit.cover,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),

        TitleText("${user.firstName} ${user.lastName}",
            margin: EdgeInsets.zero, alignment: Alignment.center),

        Text(
          "${user.email}",
          style: const TextStyle(
              fontSize: 18.0,
              color: Colors.grey,
              fontWeight: FontWeight.w300),
        ),
      ],
    );
  }




}
