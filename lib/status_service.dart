import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Status {
  String id;

  //String status;
  //String image;

  Status({required this.id});

  factory Status.fromSnapshot(DocumentSnapshot snapshot) {
    return Status(
      id: snapshot.id,
      // status: snapshot["status"],
      // image: snapshot["image"],
    );
  }
}

class StatusService {
  String gorevBaslikController = "";
  String gorevIcerikController = "";

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  // Görev ekle
  addTask(String gorevBaslikController, String gorevIcerikController) async {
    var getFirestore = await firestore
        .collection('Task')
        .doc('${auth.currentUser?.email}')
        .collection("tasks");

    var addDocument = getFirestore.doc().set({
      'GorevBaslik': gorevBaslikController,
      'GorevIcerik': gorevIcerikController,
      //'KullaniciMail': auth.currentUser?.email,
      'kullaniciUid': auth.currentUser?.uid,
    });

    return addDocument;

    // var addStatus = await getFirestore.add({
    //   'GorevBaslik': gorevBaslikController,
    //   'GorevIcerik': gorevIcerikController,
    //   //'KullaniciMail': auth.currentUser?.email,
    //   'kullaniciUid': auth.currentUser?.uid,}
    // );
    // return addStatus;
  }

  //Üye ol
  Future<void> createUser(String mailController, String sifreController,
      isimController, soyIsimController) async {
    await auth
        .createUserWithEmailAndPassword(
            email: mailController, password: sifreController)
        .then((kullanici) => FirebaseFirestore.instance
                .collection('Kullanicilar')
                .doc(mailController)
                .set({
              'kullaniciAd': isimController,
              'kullaniciSoyAd': soyIsimController,
              'kullaniciMail': mailController,
              'kullaniciSifre': sifreController,
              'kullaniciUid': auth.currentUser!.uid,
            }));
  }

  //Giriş yap
  login(String mailController, String sifreController) async {
    await auth.signInWithEmailAndPassword(
        email: mailController, password: sifreController);
  }

  removeStatus(String docId) async {
    var collection = FirebaseFirestore.instance
        .collection('Task') // Task collection
        .doc(
            '${FirebaseAuth.instance.currentUser!.email}') // Maillerin geldiği döküman
        .collection('tasks') // tasks collection
        .doc(docId); // silmek istediğim döküman

    return await collection.delete();
  }

  CollectionReference docRef =
      FirebaseFirestore.instance.collection('collection');

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await docRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print(allData);
  }

  Future<void>updateStatus(String docId, String gorevBaslikController, String gorevIcerikController) async {
   return await firestore
        .collection('Task')
        .doc('${auth.currentUser?.email}')
        .collection('tasks')
        .doc(docId)
        .update({
      'GorevBaslik': gorevBaslikController,
      'GorevIcerik': gorevIcerikController,


    });
}

  updateTasks(String docId){
    String asf;

  }
}
