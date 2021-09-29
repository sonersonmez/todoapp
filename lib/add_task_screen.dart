import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/status_service.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  TextEditingController gorevBaslikController = TextEditingController();
  TextEditingController gorevIcerikController = TextEditingController();

  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  // FirebaseAuth auth = FirebaseAuth.instance;
  // gorevEkle(){
  //   firestore.collection('Task').doc('${auth.currentUser?.email}')
  //       .collection("tasks").add({
  //     'GorevBaslik': gorevBaslikController.text,
  //     'GorevIcerik': gorevIcerikController.text,
  //     //'KullaniciMail': auth.currentUser?.email,
  //     'kullaniciUid' : auth.currentUser?.uid,}
  //   );
  //
  // }

 StatusService getStatus = StatusService();






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          "Görev Oluştur",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 120.0, left: 25.0, right: 25.0),
        child: Column(
          children: [
            TextFormField(
              controller: gorevBaslikController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.edit), labelText: "Görev Başlığı"),
            ),
            TextFormField(
              controller: gorevIcerikController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.article_rounded),
                  labelText: "Görev İçeriği"),
              maxLines: 3,
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: ()=>getStatus.addTask(gorevBaslikController.text, gorevIcerikController.text),
              child: Text(
                "Oluştur",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
