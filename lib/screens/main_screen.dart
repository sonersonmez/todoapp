import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_task_screen.dart';
import 'update_status_screen.dart';

import '../services/status_service.dart';

// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {

//   // GET COLLECTION SNAPSHOT
//   final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
//       .collection('Task')
//       .doc('${FirebaseAuth.instance.currentUser!.email}')
//       .collection('tasks')
//       .snapshots();


//   StatusService statusService = StatusService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [

//         ],
//       ),
//       floatingActionButton: mainScreenFloatingActionButton(context),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _usersStream,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text('Something went wrong');
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           return ListView(
//             children: snapshot.data!.docs.map((DocumentSnapshot document) {
//               Map<String, dynamic> data =
//                   document.data()! as Map<String, dynamic>;
//               return Card(
//                 child: ListTile(
//                   title: Text(data['GorevBaslik']),
//                   subtitle: Text(data['GorevIcerik']),
//                   trailing: Wrap(
//                     spacing: 12, // space between two icons
//                     children: <Widget>[
//                       IconButton(
//                           icon: Icon(Icons.edit),
//                           onPressed: () async {
//                             await Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => UpdateStatusPage(document.id, data)));
//                           }),
//                       IconButton(
//                         icon: Icon(Icons.remove),
//                         onPressed: () async {
                          
//                           statusService.removeStatus(document.id);
//                           },
//                       ), // icon-2
//                     ],
//                   ),
//                 ),
//               );
//             }).toList(),
//           );
//         },
//       ),
//     );
//   }

//   FloatingActionButton mainScreenFloatingActionButton(BuildContext context) {
//     return FloatingActionButton(
//       onPressed: () {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => AddTaskScreen()));
//       },
//       child: Icon(
//         Icons.add,
//         color: Colors.white,
//       ),
//     );
//   }
// }


class MainScreen extends StatelessWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: StatusService().data,
      initialData: snapshot().,
      child: Scaffold(
        
      ),
    );
  }
}