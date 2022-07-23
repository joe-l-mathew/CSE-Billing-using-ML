import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ScanProvider with ChangeNotifier {
  bool? isMatched;
  XFile? selectedImage;
  String? imagePath;
  String? userInput;
  String generatedText = "";

  setNull() {
    isMatched = null;
    selectedImage = null;
    imagePath = null;
    userInput = null;
    generatedText = "";
    notifyListeners();
  }

  setIsMatched(bool ismat) {
    isMatched = ismat;
    notifyListeners();
  }

  setSelectedImage(XFile? img) {
    selectedImage = img;
    notifyListeners();
  }

  setImagePath(String path) {
    imagePath = path;
    notifyListeners();
  }

  setUserInput(String inputText) {
    userInput = inputText;
    notifyListeners();
  }

  setGeneratedText(String generated) {
    generatedText = generated;
    notifyListeners();
  }
}
