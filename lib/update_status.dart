//this page is not working.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/status_service.dart';

class UpdateStatus extends StatefulWidget {
  @override
  _UpdateStatusState createState() => _UpdateStatusState();
}

class _UpdateStatusState extends State<UpdateStatus> {

  TextEditingController gorevBaslikController = TextEditingController();
  TextEditingController gorevIcerikController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  updateStatus(docId){
    DocumentReference guncellenecekDokuman = firestore.collection('Task').doc('${auth.currentUser!.email}').collection('tasks').doc(docId);

    guncellenecekDokuman.update({
      'GorevBaslik': gorevBaslikController.text,
      'GorevIcerik': gorevIcerikController.text,
    });

  }


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
              onPressed: (){
                FirebaseFirestore.instance.collection('Task').doc('${FirebaseAuth.instance.currentUser!.email}').collection('tasks').snapshots();

                getStatus.updateStatus('docidgir', gorevBaslikController.text,gorevIcerikController.text);
              },
              child: Text(
                "Güncelle",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// children: snapshot.data!.docs.map((DocumentSnapshot document) {
//               Map<String, dynamic> data =
//                   document.data()! as Map<String, dynamic>;

