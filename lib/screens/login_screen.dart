import 'package:flutter/material.dart';
import 'package:flutter_application_csw/screens/registration_screen.dart';

import '../firebase/auth_methods.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (builder) => SignupPage()));
              },
              icon: Icon(Icons.create))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: _emailController,
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: _passwordController,
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                AuthMethods().loginUser(
                    _emailController.text, _passwordController.text, context);
              },
              child: Text("Login"))
        ],
      ),
    );
  }
}
