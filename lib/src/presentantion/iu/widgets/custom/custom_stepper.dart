import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/stepper_ctr.dart';

class CustomStepper extends StatelessWidget {
  final CustomStepperController _customStepperController =
      CustomStepperController.initializeController();

  final EdgeInsets margin;
  final double parentStepSize;
  final double subStepSize;
  final Color unFocusColor;
  final Color focusColor;
  final Map<int, int> stepperItems;

  CustomStepper({
    Key? key,
    required this.stepperItems,
    this.parentStepSize = 24,
    this.subStepSize = 12,
    this.unFocusColor = const Color(0XFF03A851),
    this.focusColor = const Color(0XFF22593C),
    this.margin = const EdgeInsets.all(10.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: buildChilds(),
        ),
      ),
    );
  }

  List<Widget> buildChilds() {
    List<Widget> children = [];
    bool isFirstItem = true;
    int totalSteps = 0;

    for (MapEntry<int, int> entry in stepperItems.entries) {
      if (isFirstItem) {
        isFirstItem = false;
        children.addAll(buildStepTemplate(entry.key,0, false, true,entry.value > 0));
      } else {
        children.addAll(buildStepTemplate(entry.key,totalSteps, false, false,entry.value > 0));
      }
      if (entry.value > 0) {
        children.addAll(addSubStepsChildren(totalSteps,entry.value));
        totalSteps+=entry.value;
      }else{
        totalSteps+=1;
      }
    }
    _customStepperController.totalSteps = totalSteps;

    return children;
  }

  List<Widget> addSubStepsChildren(int step,int amountOfSubs) {
    List<Widget> subChildren = [];
    for (var i = 0; i < amountOfSubs; i++) {
      subChildren.addAll(buildStepTemplate(0,step+i, true, false,false));
    }
    return subChildren;
  }

  List<Widget> buildStepTemplate(int stepToShow,int step, bool isSubStep, bool isFirstItem, bool isHasSubSteps) {
    if (isFirstItem) {
      return [buildCircleTemplate(stepToShow,step, isSubStep)];
    }
    return [buildStepSeparator(step),buildCircleTemplate(stepToShow,step, isSubStep)];
  }

  Widget buildStepSeparator(int step) {
    return Obx(() => Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      width: 8.0,
      child: Divider(
          color: _customStepperController.currentStep.value > step
              ? unFocusColor
              : Colors.black,
          thickness: 1.5, 
        ),
    ));
  }

  Widget buildCircleTemplate(int steptoShow, int stepNumber, bool isSubStep) {
    return Obx(() => Container(
          width: isSubStep ? subStepSize : parentStepSize,
          height: isSubStep ? subStepSize : parentStepSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: _customStepperController.currentStep.value < stepNumber? Colors.black:(_customStepperController.currentStep.value == stepNumber
                    ? focusColor
                    : unFocusColor)),
            color: _customStepperController.currentStep.value < stepNumber
                ? Colors.white
                : (_customStepperController.currentStep.value == stepNumber
                    ? focusColor
                    : unFocusColor),
            shape: BoxShape.circle,
          ),
          child: isSubStep?Container():Text(
            "$steptoShow",
            style: TextStyle(
                color: _customStepperController.currentStep.value < stepNumber
                    ? Colors.black
                    : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0),
          ),
        ));
  }
}
