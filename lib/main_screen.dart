
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/add_task_screen.dart';
import 'package:todo_app/update_status.dart';

import 'status_service.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  final Stream<QuerySnapshot> _usersStream =  FirebaseFirestore.instance.collection('Task').doc('${FirebaseAuth.instance.currentUser!.email}').collection('tasks').snapshots();

  StatusService authService = StatusService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [],),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskScreen()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body:StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
              document.data()! as Map<String, dynamic>;
              return Card(
                child: ListTile(
                  title: Text(data['GorevBaslik']),
                  subtitle: Text(data['GorevIcerik']),
                  trailing: Wrap(
                    spacing: 12, // space between two icons
                    children: <Widget>[
                      IconButton(icon:Icon(Icons.edit), onPressed:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateStatus()));
                      }
                      ), // icon-1
                      IconButton(icon:Icon(Icons.remove), onPressed:() async {
                        authService.removeStatus(document.id);
                        // var collection =
                        // FirebaseFirestore.instance
                        //     .collection('Task') // Task collection
                        //     .doc('${FirebaseAuth.instance.currentUser!.email}') // Maillerin geldiği döküman
                        //     .collection('tasks') // tasks collection
                        //     .doc(document.id); // silmek istediğim döküman
                        //
                        // await collection
                        //       .delete();
            }, ), // icon-2
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}