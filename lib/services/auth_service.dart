import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
class AuthService{

  //Create a new user
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


// Login to app
login(String mailController, String sifreController) async {
  await auth.signInWithEmailAndPassword(
      email: mailController, password: sifreController);
}

}