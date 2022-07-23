import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ScanProvider with ChangeNotifier {
  XFile? selectedImage;
  String? imagePath;
  String? userInput;
  String? generatedText;
}
