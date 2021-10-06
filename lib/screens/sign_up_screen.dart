import 'package:flutter/material.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/services/auth_service.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController isimController = TextEditingController();
  TextEditingController soyIsimController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController sifreController = TextEditingController();
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),),
      body: Padding(
        padding: const EdgeInsets.only(top:150.0, right: 25, left: 25),
        child: Expanded(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Kayıt Ol",
                    textAlign: TextAlign.right,
                     style: TextStyle(color: Colors.white)
                  )),
              SizedBox(height:15),
              TextFormField(
                controller: isimController,
                keyboardType: TextInputType.text,
                style: lightGreen,
                decoration: isimTextFormFieldDecoration(),
              ),
              SizedBox(height:15),
              TextFormField(
                controller: soyIsimController,
                keyboardType: TextInputType.text,
                style: lightGreen,
                decoration: soyIsimTextFormFieldDecoration(),
              ),
              SizedBox(height:15),
              TextFormField(
                controller: mailController,
                keyboardType: TextInputType.emailAddress,
                style: lightGreen,
                decoration: mailTextFormFieldDecoration(),
              ),
              SizedBox(height:15),
              TextFormField(
                controller: sifreController,
                keyboardType: TextInputType.visiblePassword,
                style: lightGreen,
                decoration: sifreTextFormFieldDecoration(),
              ),
              SizedBox(height:15),
              ElevatedButton(onPressed:()=>authService.createUser(mailController.text, sifreController.text, isimController.text, soyIsimController.text), child: Text("Kayıt Ol", style: TextStyle(color:Colors.white),))
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration sifreTextFormFieldDecoration() {
    return InputDecoration(
                hintText: 'Şifreniz',
                prefixIcon: Icon(Icons.lock),
              );
  }

  InputDecoration mailTextFormFieldDecoration() {
    return InputDecoration(
                hintText: 'E-Posta Adresiniz',
                prefixIcon: Icon(Icons.mail),
              );
  }

  InputDecoration soyIsimTextFormFieldDecoration() {
    return InputDecoration(
                hintText: 'Soyadınız',
                prefixIcon: Icon(Icons.account_circle_rounded),
              );
  }

  InputDecoration isimTextFormFieldDecoration() {
    return InputDecoration(
                hintText: 'Adınız',
                prefixIcon: Icon(Icons.account_circle_rounded,),
              );
  }
}
