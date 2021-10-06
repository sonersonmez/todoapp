import 'package:flutter/material.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/services/auth_service.dart';
import 'sign_up_screen.dart';

import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mailController = TextEditingController();
  TextEditingController sifreController = TextEditingController();

AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 175.0, left: 50.0, right: 50.0),
        child: Expanded(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  child: Text("Hoşgeldin", style:TextStyle(fontSize: 20, color: Colors.lightGreen)),
              ),
              TextFormField(
                controller: mailController,
                keyboardType: TextInputType.emailAddress,
                style: lightGreen,
                decoration: mailTextFormFieldDecoration(),
              ),
              TextFormField(
                style: lightGreen,
                controller: sifreController,
                obscureText: true,
                decoration: sifreTextFormFieldDecoration(),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  authService
                      .login(mailController.text, sifreController.text)
                      .then((value) async {
                  return  await Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen()),
                        (route) => false);
                  });
                },
                child: Text("Giriş Yap", style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: Text("Kayıt Ol", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration sifreTextFormFieldDecoration() {
    return InputDecoration(
                  prefixIcon: Icon(Icons.lock), hintText: 'Şifre');
  }

  InputDecoration mailTextFormFieldDecoration() {
    return InputDecoration(
                  prefixIcon: Icon(Icons.mail), hintText: "E-Posta");
  }
}
