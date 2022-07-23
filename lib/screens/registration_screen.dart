import 'package:flutter/material.dart';

import 'package:flutter_application_csw/firebase/auth_methods.dart';
import 'package:flutter_application_csw/models/user_model.dart';
import 'package:flutter_application_csw/screens/login_screen.dart';

import '../functions/snackbar.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _nameConteroller = TextEditingController();
    final _emailConteroller = TextEditingController();
    final _phoneNumberConteroller = TextEditingController();
    final _consumerNumberConteroller = TextEditingController();
    final _areaCodeConteroller = TextEditingController();
    final _passwordConteroller = TextEditingController();
    final _confirmPasswordConteroller = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: Text("Signup"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _nameConteroller,
                  autofocus: true,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Name"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _emailConteroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Email"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _phoneNumberConteroller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Phone number"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _consumerNumberConteroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Consumer number"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _areaCodeConteroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Area code"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _passwordConteroller,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Create password"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _confirmPasswordConteroller,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Confirm password"),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_nameConteroller.text.isNotEmpty &&
                          _emailConteroller.text.isNotEmpty &&
                          _phoneNumberConteroller.text.isNotEmpty &&
                          _consumerNumberConteroller.text.isNotEmpty &&
                          _areaCodeConteroller.text.isNotEmpty &&
                          _passwordConteroller.text.isNotEmpty &&
                          _confirmPasswordConteroller.text.isNotEmpty) {
                        //checked
                        if (_passwordConteroller.text ==
                            _confirmPasswordConteroller.text) {
                          if (_passwordConteroller.text.length > 5) {
                            await AuthMethods().createUser(
                                UserModel(
                                    _nameConteroller.text,
                                    _areaCodeConteroller.text,
                                    _emailConteroller.text,
                                    null,
                                    _consumerNumberConteroller.text),
                                _passwordConteroller.text,
                                context);
                          } else {
                            showSnackbar(
                                context: context,
                                content: "Use a stronger password");
                          }
                        } else {
                          showSnackbar(
                              context: context, content: "Pasword not matched");
                        }
                      } else {
                        showSnackbar(
                            context: context,
                            content: "Please fill all fields");
                      }
                      //signup user
                    },
                    child: Text("Create Account")),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: TextButton(
                //       onPressed: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(builder: (builder) {
                //             return LoginScreen();
                //           }),
                //         );
                //       },
                //       child: Text("Already have an account? Login")),
                // )
              ],
            ),
          ),
        ));
  }
}
