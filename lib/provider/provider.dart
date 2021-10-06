import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GuncelleProvider extends ChangeNotifier {

  String gorevBaslik="";
  String gorevIcerik="";


  void gorevGuncelle(String gorevBaslik, String gorevIcerik){
    gorevBaslik=this.gorevBaslik;
    gorevIcerik=this.gorevIcerik;

    notifyListeners();
  }

}
