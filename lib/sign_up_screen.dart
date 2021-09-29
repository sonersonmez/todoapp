import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/status_service.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController isimController = TextEditingController();
  TextEditingController soyIsimController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController sifreController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  // Future<void> kayitOl() async{
  //   await auth
  //       .createUserWithEmailAndPassword(
  //       email: mailController.text, password: sifreController.text)
  //       .then(
  //           (kullanici) => FirebaseFirestore.instance
  //           .collection('Kullanicilar')
  //           .doc(mailController.text)
  //           .set({
  //          'kullaniciAd': isimController.text,
  //          'kullaniciSoyAd': soyIsimController.text,
  //          'kullaniciMail': mailController.text,
  //          'kullaniciSifre': sifreController.text,
  //          'kullaniciUid':auth.currentUser!.uid,
  //       }));
  // }

  StatusService status = StatusService();

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
                    style: TextStyle(fontSize: 20, color: Colors.lightGreen),
                  )),
              SizedBox(height:15),
              TextFormField(
                controller: isimController,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.lightGreen),
                decoration: InputDecoration(
                  hintText: 'Adınız',
                  prefixIcon: Icon(Icons.account_circle_rounded,),
                ),
              ),
              SizedBox(height:15),
              TextFormField(
                controller: soyIsimController,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.lightGreen),
                decoration: InputDecoration(
                  hintText: 'Soyadınız',
                  prefixIcon: Icon(Icons.account_circle_rounded),
                ),
              ),
              SizedBox(height:15),
              TextFormField(
                controller: mailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.lightGreen),
                decoration: InputDecoration(
                  hintText: 'E-Posta Adresiniz',
                  prefixIcon: Icon(Icons.mail),
                ),
              ),
              SizedBox(height:15),
              TextFormField(
                controller: sifreController,
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(color: Colors.lightGreen),
                decoration: InputDecoration(
                  hintText: 'Şifreniz',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height:15),
              ElevatedButton(onPressed:()=>status.createUser(mailController.text, sifreController.text, isimController.text, soyIsimController.text), child: Text("Kayıt Ol", style: TextStyle(color:Colors.white),))
            ],
          ),
        ),
      ),
    );
  }
}
