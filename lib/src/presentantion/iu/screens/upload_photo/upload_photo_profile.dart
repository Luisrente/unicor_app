// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';

// import '../../controllers/export_controllers.dart';
// import '../../widgets/controllers/stepper_ctr.dart';
// import '../../widgets/custom/custom_stepper.dart';
// import '../../widgets/custom/title_text.dart';
// import '../../widgets/export_widget.dart';
// import '../../widgets/others/shared.dart';

// class UploadPhotoProfileScreen extends StatelessWidget {
//   static const routeName = "/createActivityMainScreen";

//   final CustomStepperController _customStepperController =
//       CustomStepperController.initializeController();

//   final UploadPhotoController _activitiesController =
//       UploadPhotoController.initializeController();
      
//   final SharedController _sharedController =
//       SharedController.initializeController();
//   UploadPhotoProfileScreen({Key? key}) : super(key: key);

//   final List<String> titles = <String>[
//     'l10n.generalInformation',
//     'l10n.scaffoldInformation',
//     'l10n.scaffoldInformation',
//     'l10n.scaffoldInformation',
//     'l10n.scaffoldInformation',
//     'l10n.scaffoldInformation',
//     'l10n.scaffoldInformation',
//     'l10n.scaffoldInformation',
//     'l10n.scaffoldInformation',
//   ];
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: CustomAppBar(
//           title: "10n.newActivityBotton",
//         ),


//         // bottomNavigationBar: AppNavBar(),
//         // floatingActionButton: Obx(() =>
//         //     (_customStepperController.currentStep.value >= 5 &&
//         //             _customStepperController.currentStep.value <= 7)
//         //         ? CustomSummaryButtonPopUp()
//         //         : Container()),
//         body: Stack(
//           children: [
//             buildBody(),
//             Obx(() => _sharedController.isLoading.value
//                 ? buildLoadingIndicator()
//                 : Container())
//           ],
//         ));
//   }

//   Widget buildBody() {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [

//           Container(
//             margin: const EdgeInsets.symmetric(vertical: 20.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   child: const Icon(Icons.arrow_back),
//                   onTap: () => _customStepperController.changeToPreviousStep(),
//                 ),
//                 Obx(() => TitleText(
//                       titles[_customStepperController.currentStep.value],
//                       margin: EdgeInsets.zero,
//                     )),
//                 Container()
//               ],
//             ),
//           ),
          
//           Obx((() => CustomStepper(
//                 stepperItems: _activitiesController.stepsToDraw.value,
//               ))),
//           // Obx(() {
//           //   return _activitiesController
//           //       .formSteps[_customStepperController.currentStep.value];
//           // }),

//           TitleText(
//           'Cedula cara frontal',
//           margin: const EdgeInsets.all(10),
//           alignment: Alignment.centerLeft,
//         ),


//         CustomImageSourceWidget(
//             key: Key(
//                 "{_activitiesController.activityTemporalId}armedPhotography"),
//             imageContainerHeight: 220.0,
//             onImageSourceChanged: (File image) {
//               // _activitiesController.newActivity.value = _activitiesController
//               //     .newActivity.value
//               //     .copyWith(armedPhotography: image);
//             }),


//           TitleText(
//           'Cedula cara posterior',
//           margin: const EdgeInsets.all(10),
//           alignment: Alignment.centerLeft,
//         ),
//         CustomImageSourceWidget(
//             key: Key(
//                 "vvvvvv"),
//             imageContainerHeight: 220.0,
//             onImageSourceChanged: (File image) {
//               // _activitiesController.newActivity.value = _activitiesController
//               //     .newActivity.value
//               //     .copyWith(armedPhotography: image);
//             }),

            
//         // Obx(
//         //   () => CustomButton(
//         //     label: 'l10n.continuee',
//         //     onPressed: (){}
//         //         _activitiesController.newActivity.value.armedPhotography != null
//         //             ? () => _stepperController.changeToNextStep()
//         //             : null,
//         //   ),
//         // ),
//         //  Obx(
//         //    () =>
        
        
//         CustomButton(
//             label: 'Siguiente',
//             onPressed:
//                 // _activitiesController.newActivity.value.armedPhotography != null
//                 //     ?
//                 () async {
//               // if (_activitiesController.newActivity.value.serviceType ==
//               //     ServiceType.UNMOUNTED) {
//               //   _activitiesController.newActivity.value.scaffold = null;
//               //   _activitiesController.newActivity.value.materials = null;
//               //   _activitiesController.newActivity.value = _activitiesController
//               //       .newActivity.value
//               //       .copyWith(scaffold: null, materials: null);
//               //   _activitiesController.activityMetrics.clear();
//               // }
//               // await _activitiesController.saveActivity(true);
//             }
//             //   : null,
//             ),
//         //     ),
//       ],
//     ));
//   }  
// }

import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class ImagePickers extends StatefulWidget {
  const ImagePickers({Key? key}) : super(key: key);

  @override
  State<ImagePickers> createState() => _ImagePickersState();
}

class _ImagePickersState extends State<ImagePickers> {
  List<XFile>? _imageFileList;

  void _setImageFileListFromFile(XFile? value) {
    _imageFileList = value == null ? null : <XFile>[value];
  }

  dynamic _pickImageError;
  bool isVideo = false;

  VideoPlayerController? _controller;
  VideoPlayerController? _toBeDisposed;
  String? _retrieveDataError;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  Future<void> _playVideo(XFile? file) async {
    if (file != null && mounted) {
      await _disposeVideoController();
      late VideoPlayerController controller;
      if (kIsWeb) {
        controller = VideoPlayerController.network(file.path);
      } else {
        controller = VideoPlayerController.file(File(file.path));
      }
      _controller = controller;
      const double volume = kIsWeb ? 0.0 : 1.0;
      await controller.setVolume(volume);
      await controller.initialize();
      await controller.setLooping(true);
      await controller.play();
      setState(() {});
    }
  }

  Future<void> _onImageButtonPressed(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    if (_controller != null) {
      await _controller!.setVolume(0.0);
    }
    if (isVideo) {
      final XFile? file = await _picker.pickVideo(
          source: source, maxDuration: const Duration(seconds: 10));
      await _playVideo(file);
    } else if (isMultiImage) {
      await _displayPickImageDialog(context!,
          (double? maxWidth, double? maxHeight, int? quality) async {
        try {
          final List<XFile> pickedFileList = await _picker.pickMultiImage(
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: quality,
          );
          setState(() {
            _imageFileList = pickedFileList;
          });
        } catch (e) {
          setState(() {
            _pickImageError = e;
          });
        }
      });
    } else {
      await _displayPickImageDialog(context!,
          (double? maxWidth, double? maxHeight, int? quality) async {
        try {
          final XFile? pickedFile = await _picker.pickImage(
            source: source,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: quality,
          );
          setState(() {
            _setImageFileListFromFile(pickedFile);
          });
        } catch (e) {
          setState(() {
            _pickImageError = e;
          });
        }
      });
    }
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller!.setVolume(0.0);
      _controller!.pause();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    _disposeVideoController();
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }

  Future<void> _disposeVideoController() async {
    if (_toBeDisposed != null) {
      await _toBeDisposed!.dispose();
    }
    _toBeDisposed = _controller;
    _controller = null;
  }

  Widget _previewVideo() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_controller == null) {
      return const Text(
        'You have not yet picked a video',
        textAlign: TextAlign.center,
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AspectRatioVideo(_controller),
    );
  }

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFileList != null) {
      return Semantics(
        label: 'image_picker_example_picked_images',
        child: ListView.builder(
          key: UniqueKey(),
          itemBuilder: (BuildContext context, int index) {
            return Semantics(
                label: 'image_picker_example_picked_image',
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: _imageFileList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      child: Image.file(File(_imageFileList![index].path),
                          fit: BoxFit.cover),
                    );
                  },
                ));
          },
          itemCount: _imageFileList!.length,
        ),
      );
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _handlePreview() {
    if (isVideo) {
      return _previewVideo();
    } else {
      return _previewImages();
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
        isVideo = true;
        await _playVideo(response.file);
      } else {
        isVideo = false;
        setState(() {
          if (response.files == null) {
            _setImageFileListFromFile(response.file);
          } else {
            _imageFileList = response.files;
          }
        });
      }
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Multi Image picker',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Theme.of(context).primaryColor),
      body: Center(
        child: !kIsWeb && defaultTargetPlatform == TargetPlatform.android
            ? FutureBuilder<void>(
                future: retrieveLostData(),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const Text(
                        'You have not yet picked an image.',
                        textAlign: TextAlign.center,
                      );
                    case ConnectionState.done:
                      return _handlePreview();
                    case ConnectionState.active:
                      if (snapshot.hasError) {
                        return Text(
                          'Pick image/video error: ${snapshot.error}}',
                          textAlign: TextAlign.center,
                        );
                      } else {
                        return const Text(
                          'You have not yet picked an image.',
                          textAlign: TextAlign.center,
                        );
                      }
                  }
                },
              )
            : _handlePreview(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Semantics(
            label: 'image_picker_example_from_gallery',
            child: FloatingActionButton(
              onPressed: () {
                isVideo = false;
                _onImageButtonPressed(ImageSource.gallery, context: context);
              },
              heroTag: 'image0',
              tooltip: 'Pick Image from gallery',
              child: const Icon(Icons.photo),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                isVideo = false;
                _onImageButtonPressed(
                  ImageSource.gallery,
                  context: context,
                  isMultiImage: true,
                );
              },
              heroTag: 'image1',
              tooltip: 'Pick Multiple Image from gallery',
              child: const Icon(Icons.photo_library),
            ),
          ),
        ],
      ),
    );
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add optional parameters'),
            content: Column(
              children: <Widget>[
                TextField(
                  controller: maxWidthController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                      hintText: 'Enter maxWidth if desired'),
                ),
                TextField(
                  controller: maxHeightController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                      hintText: 'Enter maxHeight if desired'),
                ),
                TextField(
                  controller: qualityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Enter quality if desired'),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  child: const Text('PICK'),
                  onPressed: () {
                    final double? width = maxWidthController.text.isNotEmpty
                        ? double.parse(maxWidthController.text)
                        : null;
                    final double? height = maxHeightController.text.isNotEmpty
                        ? double.parse(maxHeightController.text)
                        : null;
                    final int? quality = qualityController.text.isNotEmpty
                        ? int.parse(qualityController.text)
                        : null;
                    onPick(width, height, quality);
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }
}

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);

class AspectRatioVideo extends StatefulWidget {
  const AspectRatioVideo(this.controller, {Key? key}) : super(key: key);

  final VideoPlayerController? controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController? get controller => widget.controller;
  bool initialized = false;

  void _onVideoControllerUpdate() {
    if (!mounted) {
      return;
    }
    if (initialized != controller!.value.isInitialized) {
      initialized = controller!.value.isInitialized;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller!.addListener(_onVideoControllerUpdate);
  }

  @override
  void dispose() {
    controller!.removeListener(_onVideoControllerUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: controller!.value.aspectRatio,
          child: VideoPlayer(controller!),
        ),
      );
    } else {
      return Container();
    }
  }
}






