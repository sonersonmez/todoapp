import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/provider.dart';
import '../services/status_service.dart';

class UpdateStatusPage extends StatefulWidget {
  //GET DOCUMENT ID FROM MAIN_SCREEN CONSTRUCTOR
  var docId;
  var data;

  UpdateStatusPage(this.docId, this.data);

  @override
  _UpdateStatusPageState createState() => _UpdateStatusPageState();
}

class _UpdateStatusPageState extends State<UpdateStatusPage> {
  TextEditingController gorevBaslikController = TextEditingController();
  TextEditingController gorevIcerikController = TextEditingController();
  StatusService statusService = StatusService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text("Görev Oluştur",style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 25.0, right: 25.0),
        child: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Güncellenecek görev:" ,style: TextStyle(fontSize: 18),),
                Text('Başlık: ' + widget.data['GorevBaslik'] ,style: TextStyle(fontSize: 18),),
                Text('içerik: ' + widget.data['GorevIcerik'],style: TextStyle(fontSize: 18),),
              ],
            ),
            TextFormField(
              controller: gorevBaslikController,
              onChanged: (input){
              
              },
              decoration: gorevBaslikTextFormFieldDecoration(),
            ),
            TextFormField(
              controller: gorevIcerikController,
              onChanged:(input){
               
              },
              decoration: gorevIcerikTextFormFieldDecoration(),
              maxLines: 3,
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                statusService.updateStatus(widget.docId,
                    gorevBaslikController.text, gorevIcerikController.text);
              },
              child: Text("Güncelle",style:TextStyle(color: Colors.white)),
            ),
            


          ],
        ),
      ),
    );
  }

  InputDecoration gorevIcerikTextFormFieldDecoration() {
    return InputDecoration(
        prefixIcon: Icon(Icons.article_rounded),
        labelText: "Yeni görev içeriği");
  }

  InputDecoration gorevBaslikTextFormFieldDecoration() {
    return InputDecoration(
        prefixIcon: Icon(Icons.edit),
        labelText: "Güncellemek istediğiniz görev başlığı");
  }
}
