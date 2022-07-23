import 'package:flutter/material.dart';
import 'package:flutter_application_csw/functions/recognise.dart';
import 'package:flutter_application_csw/functions/snackbar.dart';
import 'package:flutter_application_csw/provider/scan_pprovider.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:provider/provider.dart';

Future<void> cropImage(context) async {
  CroppedFile? croppedFile = await ImageCropper().cropImage(
    sourcePath:
        Provider.of<ScanProvider>(context, listen: false).selectedImage!.path,
    aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ],
    uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      IOSUiSettings(
        title: 'Cropper',
      ),
    ],
  );

  if (croppedFile != null) {
    Provider.of<ScanProvider>(context, listen: false)
        .setImagePath(croppedFile.path);
    getRecognisedText(context);
  } else {
    showSnackbar(context: context, content: "Failed to fetch details");
    ;
  }
}
