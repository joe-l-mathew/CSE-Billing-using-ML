import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_csw/functions/snackbar.dart';
import 'package:flutter_application_csw/provider/scan_pprovider.dart';
import 'package:flutter_application_csw/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ShowBill extends StatelessWidget {
  const ShowBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Bill")),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
                child: Provider.of<ScanProvider>(context).isMatched!
                    ? Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.check), Text("Success")],
                        ),
                        height: 100,
                        width: 100,
                        color: Colors.green,
                      )
                    : Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.info), Text("Failed")],
                        ),
                        height: 100,
                        width: 100,
                        color: Colors.red,
                      )),
            SizedBox(
              height: 10,
            ),
            Text("Name:" + Provider.of<UserProvider>(context).userModel!.name),
            SizedBox(
              height: 10,
            ),
            Text("Consumer number:" +
                Provider.of<UserProvider>(context).userModel!.consuernumber),
            SizedBox(
              height: 10,
            ),
            Text("Units:" + Provider.of<ScanProvider>(context).userInput!),
            SizedBox(
              height: 10,
            ),
            Text("Recognised:" +
                Provider.of<ScanProvider>(context).generatedText),
            SizedBox(
              height: 30,
            ),
            Provider.of<ScanProvider>(context).isMatched!
                ? Text(
                    "Amount to be paid :" +
                        Provider.of<ScanProvider>(context).userInput!,
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  )
                : SizedBox()
          ],
        ),
        floatingActionButton: Provider.of<ScanProvider>(context).isMatched!
            ? ElevatedButton(
                child: Text("Pay"),
                onPressed: () {
                  showSnackbar(
                      context: context, content: "Forward to payment page");
                },
              )
            : null);
  }
}
