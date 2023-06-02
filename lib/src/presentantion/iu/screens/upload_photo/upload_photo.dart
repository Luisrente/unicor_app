import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../controllers/export_controllers.dart';
import '../../widgets/controllers/stepper_ctr.dart';
import '../../widgets/custom/custom_stepper.dart';
import '../../widgets/custom/title_text.dart';
import '../../widgets/export_widget.dart';
import '../../widgets/others/shared.dart';

class UploadPhotoScreen extends StatelessWidget {
  static const routeName = "/createActivityMainScreen";

  final CustomStepperController _customStepperController =
      CustomStepperController.initializeController();

  final UploadPhotoController _activitiesController =
      UploadPhotoController.initializeController();
      
  final SharedController _sharedController =
      SharedController.initializeController();
  UploadPhotoScreen({Key? key}) : super(key: key);

  final List<String> titles = <String>[
    'l10n.generalInformation',
    'l10n.scaffoldInformation',
    'l10n.scaffoldInformation',
    'l10n.scaffoldInformation',
    'l10n.scaffoldInformation',
    'l10n.scaffoldInformation',
    'l10n.scaffoldInformation',
    'l10n.scaffoldInformation',
    'l10n.scaffoldInformation',
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "10n.newActivityBotton",
        ),
        bottomNavigationBar: AppNavBar(),
        // floatingActionButton: Obx(() =>
        //     (_customStepperController.currentStep.value >= 5 &&
        //             _customStepperController.currentStep.value <= 7)
        //         ? CustomSummaryButtonPopUp()
        //         : Container()),
        body: Stack(
          children: [
            buildBody(),
            Obx(() => _sharedController.isLoading.value
                ? buildLoadingIndicator()
                : Container())
          ],
        ));
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: const Icon(Icons.arrow_back),
                  onTap: () => _customStepperController.changeToPreviousStep(),
                ),
                Obx(() => TitleText(
                      titles[_customStepperController.currentStep.value],
                      margin: EdgeInsets.zero,
                    )),
                Container()
              ],
            ),
          ),
          
          Obx((() => CustomStepper(
                stepperItems: _activitiesController.stepsToDraw.value,
              ))),
          // Obx(() {
          //   return _activitiesController
          //       .formSteps[_customStepperController.currentStep.value];
          // }),

          TitleText(
          'Cedula cara frontal',
          margin: const EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
        ),


        CustomImageSourceWidget(
            key: Key(
                "{_activitiesController.activityTemporalId}armedPhotography"),
            imageContainerHeight: 220.0,
            onImageSourceChanged: (File image) {
              // _activitiesController.newActivity.value = _activitiesController
              //     .newActivity.value
              //     .copyWith(armedPhotography: image);
            }),

        CustomImageSourceWidget(
            key: Key(
                "vvvvvv"),
            imageContainerHeight: 220.0,
            onImageSourceChanged: (File image) {
              // _activitiesController.newActivity.value = _activitiesController
              //     .newActivity.value
              //     .copyWith(armedPhotography: image);
            }),

            
        // Obx(
        //   () => CustomButton(
        //     label: 'l10n.continuee',
        //     onPressed: (){}
        //         _activitiesController.newActivity.value.armedPhotography != null
        //             ? () => _stepperController.changeToNextStep()
        //             : null,
        //   ),
        // ),
        //  Obx(
        //    () =>
        
        
        CustomButton(
            label: 'l10n.saveActivity',
            onPressed:
                // _activitiesController.newActivity.value.armedPhotography != null
                //     ?
                () async {
              // if (_activitiesController.newActivity.value.serviceType ==
              //     ServiceType.UNMOUNTED) {
              //   _activitiesController.newActivity.value.scaffold = null;
              //   _activitiesController.newActivity.value.materials = null;
              //   _activitiesController.newActivity.value = _activitiesController
              //       .newActivity.value
              //       .copyWith(scaffold: null, materials: null);
              //   _activitiesController.activityMetrics.clear();
              // }
              // await _activitiesController.saveActivity(true);
            }
            //   : null,
            ),
        //     ),
      ],

    ));
  }
    
}
