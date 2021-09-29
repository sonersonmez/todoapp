import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/sign_up_screen.dart';
import 'package:todo_app/status_service.dart';

import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mailController = TextEditingController();
  TextEditingController sifreController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  // girisYap(){
  //   auth.signInWithEmailAndPassword(email: mailController.text, password: sifreController.text);
  //
  // }

  StatusService status = StatusService();

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
                  child: Text(
                    "Hoşgeldin!",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 20, color: Colors.lightGreen),
                  )),
              TextFormField(
                controller: mailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.lightGreen),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail), hintText: "E-Posta"),
              ),
              TextFormField(
                style: TextStyle(color: Colors.lightGreen),
                controller: sifreController,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock), hintText: 'Şifre'),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  status
                      .login(mailController.text, sifreController.text)
                      .then((value) async {
                  return  await Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen()),
                        (route) => false);
                  });
                },
                child: Text(
                  "Giriş Yap",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: Text(
                  "Kayıt Ol",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
