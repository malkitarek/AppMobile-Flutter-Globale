import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File file;
  void pickImageGallery() async{
    PickedFile pickedFile= await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      file=File(pickedFile.path);
    });
  }
  void pickImageCamera() async{
    PickedFile pickedFile= await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      file=File(pickedFile.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Caméra Page"),),
      body:(file==null)? Center(child: Text("Sélectionner l'icon pour ajouter une photo "),):
            Image.file(file),
      floatingActionButton:
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // SpeedDial
            Text(''),
            Column(
              children: [
                FloatingActionButton(
                  onPressed: pickImageCamera,
                  heroTag: 0,
                  child: Icon(Icons.camera_alt),
                  backgroundColor: Colors.deepOrange,
                ),
                FloatingActionButton(
                  onPressed:pickImageGallery,
                  heroTag: 1,
                  child: Icon(Icons.collections),
                  backgroundColor: Colors.deepOrange,
                ),
              ],
            )
          ],
        ),

    );
  }
}
