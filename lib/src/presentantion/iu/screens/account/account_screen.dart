


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicor_app/src/presentantion/iu/controllers/export_controllers.dart';
import '../../../../domain/models/export_model.dart';
import '../../../context/app_assets.dart';
import '../../../router/router.dart';
import '../../widgets/export_widget.dart';




class AccountScreen extends GetWidget<AccountController> with RouteAware {
  static const routeName = "/myAccountScreen";

  // final SessionController _sessionController =
  //     SessionController.initializeController();

  // final MyAccountController _accountController =
  //     MyAccountController.initializeController();

  // late User currentUserData;

  AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // currentUserData = _sessionController.getCurrentUserData();

    return Scaffold(
          appBar: CustomAppBarPhoto(
        leadingWidget: TextButton(
          child:  Icon(Icons.chevron_left_outlined , size: 40),
          style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
          onPressed: () {
           Get.offNamed(Routes.home);
          },
        )  
        ),
      // bottomNavigationBar: AppNavBar(),
      body: SingleChildScrollView(
        child: buildMyAccountBody(size),
      ),
    );
  }

  Widget buildMyAccountBody(Size size) {
    return Column(
      children: [


        
        Obx( () {
         final user = controller.user.value;
         return  buildAccountDetail(size, user);

        } 
        ),

        Obx( () {
         final user = controller.user.value;
         return  buildEditableData(size, user);

        } 
        ),


        buildOptionsCard(size)
      ],
    );
  }


Widget buildAccountDetail(Size size, User user) {
  String userPhotoUrl = "";

  return Container(
    padding: const EdgeInsets.all(16.0),
    child: Column(
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

        
        const SizedBox(height: 10),
        Container(
          height: 1,
          color: Colors.grey,
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TitleText(
              "${user.firstName} ${user.middleName}",
              margin: EdgeInsets.zero,
              alignment: Alignment.center,
            ),
            Text(
              "${user.role}",
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    ),
  );
}
 
  Widget buildEditableData(Size size , User user ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleText(
                "Datos personales",
                margin: EdgeInsets.symmetric(horizontal: 1.0),
              ),
              
            ],
          ),
       
         buildEditableDataTile(
                size,
                "Número identification",
               "${user.identification}"
                    ),
          

          buildEditableDataTile(
              size, "email electrónico", "${user.email}"),
        ],
      ),
    );
  }

  Widget buildEditableDataTile(Size size, String label, String content) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: AppAssets.whiteColor,
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
                fontWeight: FontWeight.w300),
          ),
          Text(
            content,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  Widget buildOptionsCard(Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

       

           TextButton(
            onPressed: (){ 

              Get.toNamed(Routes.newPassword);

              
              },
            child: buildOptionButton(size, "Cambiar contraseña"),
                            style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),

            ),


          
          // buildOptionButton(size, "Términos y condiciones"),
        ],
      ),
    );
  }

  Widget buildOptionButton(Size size, String optionLabel) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: AppAssets.whiteColor,
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TitleText(
            optionLabel,
            margin: const EdgeInsets.symmetric(horizontal: 2.0),
          ),
          const Icon(Icons.arrow_forward_ios_rounded)
        ],
      ),
    );
  }
}