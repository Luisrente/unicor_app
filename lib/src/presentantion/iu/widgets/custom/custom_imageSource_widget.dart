import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../controllers/imageSource_ctr.dart';
import '../export_widget.dart';
import '../others/shared.dart';

class CustomImageSourceWidget extends StatelessWidget {
  final Function(File) onImageSourceChanged;
  final double imageContainerHeight;
  final String? defaultPath;
  final String? urlImage;
  final ImageSourceController _imageSourceController =
      ImageSourceController.initializeController();

  CustomImageSourceWidget({
    required Key key,
    this.imageContainerHeight = 300.0,
    this.defaultPath,
    this.urlImage,
    required this.onImageSourceChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String defaultValuePath;
    if (defaultPath != null) {
      defaultValuePath = defaultPath!;
      _imageSourceController.setSourcePath(key.toString(), defaultValuePath);
    } else {
      defaultValuePath = "";
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Por favor seleciona una foto",
            // l10n.photographicRecord,
            style: TextStyle(
                fontSize: 12.0, fontFamily: 'Arial', color: Colors.grey[600]!),
          ),
          Obx(
            () => (urlImage != null &&
                    _imageSourceController
                        .getSourcePath(key.toString())
                        .isEmpty)
                ? buildImageContentLoad(urlImage, imageContainerHeight,
                    MediaQuery.of(context).size.width)
                : Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    alignment: Alignment.center,
                    height: imageContainerHeight,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(8),
                        image: _imageSourceController
                                .getSourcePath(key.toString())
                                .isNotEmpty
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(File(_imageSourceController
                                    .getSourcePath(key.toString()))))
                            : null),
                    child: _imageSourceController
                            .getSourcePath(key.toString())
                            .isEmpty
                        ? Container(
                          child: Icon(
                              Icons.cloud_upload_rounded,
                              size: 70.0,
                              color: Colors.grey[600],
                            ),
                        )
                        : Container(),
                  ),
            // Shared preferences component
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  margin: const EdgeInsets.only(right: 10.0),
                  label: "Tomar",
                  customBorder:
                      const BorderSide(color: Colors.black, width: 1.5),
                  backgroundColor: Colors.white,
                  labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                  onPressed: () => getImageFromSource(ImageSource.camera),
                ),
              ),
              Expanded(
                  child: CustomButton(
                label: "Subir",
                margin: const EdgeInsets.only(left: 10.0),
                customBorder: const BorderSide(color: Colors.black, width: 1.5),
                labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
                backgroundColor: Colors.white,
                onPressed: () => getImageFromSource(ImageSource.gallery),
              )),
            ],
          ),
        ],
      ),
    );
  }

  void getImageFromSource(ImageSource source) async {
    var status = await Permission.camera.status;
    if (status.isDenied) {
      await Permission.camera.request();
      return;
    }
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      _imageSourceController.sourcePath.value = image.path;
      _imageSourceController.setSourcePath(key.toString(), image.path);
      final imageFile = File(image.path);
      onImageSourceChanged(imageFile);
    }
  }
}
