import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_csw/provider/scan_pprovider.dart';
import 'package:flutter_application_csw/screens/show_bill_screen.dart';
import 'package:provider/provider.dart';

import '../functions/pick_image.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _inputTextController = TextEditingController();
    return Scaffold(
      floatingActionButton: Provider.of<ScanProvider>(context).isMatched != null
          ? ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => ShowBill()));
              },
              child: Text('Generate Bill'),
            )
          : null,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _inputTextController,
          ),
          Provider.of<ScanProvider>(context).imagePath == null
              ? GestureDetector(
                  onTap: () {
                    Provider.of<ScanProvider>(context, listen: false)
                        .setUserInput(_inputTextController.text);
                    pickImage(context);
                  },
                  child: Container(
                    height: 200,
                    width: 300,
                    color: Colors.green,
                  ),
                )
              : Image.file(File(Provider.of<ScanProvider>(context).imagePath!)),
          SizedBox(
            height: 30,
          ),
          Text(Provider.of<ScanProvider>(context).generatedText),
          SizedBox(
            height: 20,
          ),
          Provider.of<ScanProvider>(context).isMatched != null
              ? Center(
                  child: Provider.of<ScanProvider>(context).isMatched!
                      ? Text("Match Found")
                      : Text("Matching Failed"),
                )
              : SizedBox()
        ]),
      ),
    );
  }
}
