import 'package:flutter/cupertino.dart';
import 'package:flutter_application_csw/functions/crop_image.dart';
import 'package:flutter_application_csw/provider/scan_pprovider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

Future<void> pickImage(BuildContext context) async {
  final ImagePicker _picker = ImagePicker();
  final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
  if (photo != null) {
    Provider.of<ScanProvider>(context, listen: false).setSelectedImage(photo);
    Provider.of<ScanProvider>(context, listen: false).setImagePath(photo.path);
    cropImage(context);
  }
}
