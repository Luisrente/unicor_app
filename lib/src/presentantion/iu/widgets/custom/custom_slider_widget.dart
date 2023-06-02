import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../context/export_context.dart';
import '../../../router/router.dart';
import '../../controllers/export_controllers.dart';
import '../export_widget.dart';


class SliderWidget extends StatelessWidget {
  final List<Widget> slides;
  final Color? primaryColor;
  final Color? secundaryColor;
  final bool dotsOnTop;
  final bool hasDots;
  final double? primarySize;
  final double? secundarySize;
  final EdgeInsetsGeometry dotsMargin;
  final EdgeInsetsGeometry pagePadding;

  final SliderPropertiesController _propertiesController =
      Get.put(SliderPropertiesController());

  SliderWidget({
    Key? key,
    required this.slides,
    this.secundaryColor,
    this.primaryColor,
    this.dotsOnTop = false,
    this.hasDots = true,
    this.primarySize,
    this.secundarySize,
    this.dotsMargin = const EdgeInsets.all(10.0),
    this.pagePadding =
        const EdgeInsets.symmetric(vertical: 50.0, horizontal: 0),
  });

  @override
  Widget build(BuildContext context) {
    initializedProperties();

    return Stack(
      children: <Widget>[
        _Slides(
          slides: slides,
          pagePadding: pagePadding,
        ),
        if (hasDots)
          Column(
            mainAxisAlignment: (dotsOnTop)
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: <Widget>[
              _Dots(
                pages: slides.length,
                dotsMargin: dotsMargin,
              )
            ],
          ),
      ],
    );
  }

  void initializedProperties() {
    if (primaryColor != null){
      _propertiesController.setPrimaryColor(primaryColor!);
    }
    if (secundaryColor != null){
      _propertiesController.setSecundaryColor(secundaryColor!);
    }
    if (primarySize != null){
      _propertiesController.setPrimarySize(primarySize!);
    }
    if (secundarySize != null){
      _propertiesController.setSecundarySize(secundarySize!);
    }
  }
}

class _Slides extends StatelessWidget {
  final List<Widget> slides;
  final EdgeInsetsGeometry pagePadding;

  final SliderPropertiesController _propertiesController = SliderPropertiesController.initializeController();
  _Slides({required this.slides, required this.pagePadding});

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: _propertiesController.pageViewController.value,
        onPageChanged: (index) {
          _propertiesController.setCurrentPage(index);
        },
        children: slides
            .map((slide) => _Slide(
                  slide: slide,
                  pagePadding: pagePadding,
                ))
            .toList(),
      );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  final EdgeInsetsGeometry pagePadding;

  const _Slide({
    required this.slide, required this.pagePadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: pagePadding,
      width: double.infinity,
      height: double.infinity,
      child: slide,
    );
  }
}

class _Dots extends GetWidget<SplashController> {
  final int pages;
  final EdgeInsetsGeometry dotsMargin;

  
  final SliderPropertiesController _propertiesController =
        SliderPropertiesController.initializeController();

        
  _Dots({
    required this.pages, required this.dotsMargin});

  @override
  Widget build(BuildContext context) {
     SplashController splashController;
    return Container(
      margin: dotsMargin,
      width: double.maxFinite,
      child: Column(
        children: [
          Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(pages, (i) => _Dot(dotId: i)),
      ),
        CustomButton(
          constraints: const BoxConstraints(maxWidth: 180.0),
          labelStyle: TextStyle(color: AppAssets.blackColor,fontSize: 18.0,fontWeight: FontWeight.bold),
          backgroundColor: AppAssets.whiteColor,
          label: "Siguiente", onPressed: ()async {
          if(_propertiesController.pageViewController.value.page==2.0){
             
            Get.offAllNamed(Routes.home);
            
            _propertiesController.currentpage.value = 0;
          }else{
            _propertiesController.pageViewController.value.nextPage(
                duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
          }
        })
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int dotId;
  final SliderPropertiesController _propertiesController =
        SliderPropertiesController.initializeController();
  _Dot({required this.dotId});

  @override
  Widget build(BuildContext context) {
    

    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.all(5.0),
        width: (_propertiesController.currentpage.value == dotId)
            ? _propertiesController.primarySize.value
            : _propertiesController.secundarySize.value,
        height: (_propertiesController.currentpage.value == dotId)
            ? _propertiesController.primarySize.value
            : _propertiesController.secundarySize.value,
        decoration: BoxDecoration(
            color: (_propertiesController.currentpage.value == dotId)
                ? _propertiesController.primaryColor.value
                : _propertiesController.secundaryColor.value,
            shape: BoxShape.circle),
      ),
    );
  }
}

class SliderPropertiesController extends GetxController {
  static SliderPropertiesController initializeController() {
    try {
      SliderPropertiesController controller =
          Get.find<SliderPropertiesController>();
      return controller;
    } catch (e) {
      SliderPropertiesController controller =
          Get.put(SliderPropertiesController());
      return controller;
    }
  }

  RxInt currentpage = 0.obs;
  RxDouble primarySize = 20.0.obs;
  RxDouble secundarySize = 15.0.obs;
  Rx<Color> primaryColor = const Color(0xFFFFFFFF).obs;
  Rx<Color> secundaryColor = Colors.black.obs;

  Rx<PageController> pageViewController = PageController().obs;

  void setCurrentPage(int newCurrentPage) {
    currentpage.value = newCurrentPage;
  }

  void setPrimarySize(double newPrimarySize) {
    primarySize.value = newPrimarySize;
  }

  void setSecundarySize(double newSecundarySize) {
    secundarySize.value = newSecundarySize;
  }

  void setPrimaryColor(Color newPrimaryColor) {
    primaryColor.value = newPrimaryColor;
  }

  void setSecundaryColor(Color newSecundaryColor) {
    secundaryColor.value = newSecundaryColor;
  }

  @override
  void onClose() {
    currentpage.value = 0;
    pageViewController.value.dispose();
    pageViewController.value = PageController();
    super.onClose();
  }
}
