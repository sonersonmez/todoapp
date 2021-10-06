import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class StatusService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  // Add task
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
  }

  // Remove task
  removeStatus(String docId) async {
    var collection = FirebaseFirestore.instance
        .collection('Task') // Task collection
        .doc(
            '${FirebaseAuth.instance.currentUser!.email}') // Maillerin geldiği döküman
        .collection('tasks') // tasks collection
        .doc(docId); // silmek istediğim döküman

    return await collection.delete();
  }

  // Update task
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
  

}
