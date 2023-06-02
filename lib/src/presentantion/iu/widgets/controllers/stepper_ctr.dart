import 'package:get/get.dart';

class CustomStepperController extends GetxController {

  static CustomStepperController initializeController() {
    try {
      CustomStepperController controller =
          Get.find<CustomStepperController>();
      return controller;
    } catch (e) {
      CustomStepperController controller =
          Get.put(CustomStepperController());
      return controller;
    }
  }

  RxInt currentStep = 0.obs;
  int totalSteps = 0;

  void resetCustomStepper(){
    currentStep.value = 0;
    totalSteps = 0;
  }

  void changeToNextStep(){
    if(!(currentStep.value+1 > totalSteps)){
      currentStep.value +=1;
    }
  }

  void changeToPreviousStep(){
    if(currentStep.value-1 >= 0){
      currentStep.value -=1;
    }else{
      Get.back();
    }
  }

  void changeToNPreviousStep(int step){
    if(currentStep.value-step>=0){
      currentStep.value = currentStep.value - step;
    }
  }

  void changeToSpecifcStep(int step){
    if(step<=totalSteps && step>=0){
      currentStep.value = step;
    }
  }
  
}