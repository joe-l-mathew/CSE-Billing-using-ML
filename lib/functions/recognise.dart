import 'package:flutter/cupertino.dart';
import 'package:flutter_application_csw/functions/snackbar.dart';
import 'package:flutter_application_csw/provider/scan_pprovider.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:provider/provider.dart';

// Future<void> getRecognisedText(context) async {
//   final inputImage = InputImage.fromFilePath(
//       Provider.of<ScanProvider>(context, listen: false).imagePath!);
//   final textDetector = GoogleMlKit.vision.textRecognizer();
//   RecognizedText recognisedText = await textDetector.processImage(inputImage);
//   await textDetector.close();
//   // ignore: use_build_context_synchronously
//   Provider.of<ScanProvider>(context, listen: false).setGeneratedText('');
//   for (TextBlock block in recognisedText.blocks) {
//     for (TextLine line in block.lines) {
//       // ignore: use_build_context_synchronously
//       Provider.of<ScanProvider>(context, listen: false).setGeneratedText(
//           // ignore: use_build_context_synchronously
//           "${Provider.of<ScanProvider>(context, listen: false).generatedText}${line.text}\n");
//     }
//   }

// ignore: use_build_context_synchronously
// }

void getRecognisedText(BuildContext context) async {
  final inputImage = InputImage.fromFilePath(
      Provider.of<ScanProvider>(context, listen: false).imagePath!);
  final textDetector = GoogleMlKit.vision.textRecognizer();
  RecognizedText recognisedText = await textDetector.processImage(inputImage);
  await textDetector.close();
  Provider.of<ScanProvider>(context, listen: false).setGeneratedText('');
  for (TextBlock block in recognisedText.blocks) {
    Provider.of<ScanProvider>(context, listen: false).setGeneratedText(
        "${Provider.of<ScanProvider>(context, listen: false).generatedText}${block.text}\n");
    if (Provider.of<ScanProvider>(context, listen: false).userInput!.length !=
        0) {
      if (Provider.of<ScanProvider>(context, listen: false)
          .generatedText
          .toLowerCase()
          .contains(Provider.of<ScanProvider>(context, listen: false)
              .userInput!
              .trim()
              .toLowerCase())) {
        Provider.of<ScanProvider>(context, listen: false).setIsMatched(true);
      } else {
        Provider.of<ScanProvider>(context, listen: false).setIsMatched(false);
      }
    } else {
      showSnackbar(context: context, content: "Enter some value");
    }

    for (TextLine line in block.lines) {
      // Provider.of<ScanProvider>(context, listen: false).setGeneratedText(
      //     "${Provider.of<ScanProvider>(context, listen: false).generatedText}${line.text}\n");
    }
  }
}
