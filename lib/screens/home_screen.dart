import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_csw/firebase/firestore_methods.dart';
import 'package:flutter_application_csw/provider/scan_pprovider.dart';
import 'package:flutter_application_csw/provider/user_provider.dart';
import 'package:flutter_application_csw/screens/scan_page.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FirestoreMethods()
          .getUserDetails(FirebaseAuth.instance.currentUser!.uid, context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<ScanProvider>(context, listen: false).setNull();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => ScanPage(),
                ));
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Column(
          children: [
            Container(
                width: double.infinity,
                height: 100,
                color: Colors.amber,
                child: Provider.of<UserProvider>(context).userModel == null
                    ? CircularProgressIndicator()
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Name:${Provider.of<UserProvider>(context, listen: false).userModel!.name}"),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                "Consumer number:${Provider.of<UserProvider>(context, listen: false).userModel!.consuernumber}"),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                      )),
            Text(
              "History",
              style: TextStyle(fontSize: 30),
            ),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title:
                            Text("Consumer number : ${323667 * (index + 1)}"),
                        subtitle: Text("Name : username${index + 1}"),
                        trailing: Text(
                            "${DateTime.now().subtract(Duration(days: 30 * index)).year.toString()}-${DateTime.now().subtract(Duration(days: 30 * index)).month.toString().padLeft(2, '0')}-${DateTime.now().subtract(Duration(days: 30 * index)).day.toString().padLeft(2, '0')}"),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemCount: 30))
          ],
        ));
  }
}
