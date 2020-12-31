import 'package:flutter/material.dart';
import 'package:my_first_app/pages/camera/cameraPage.dart';
import 'package:my_first_app/pages/garllery/galleryPage.dart';
import 'package:my_first_app/pages/home/homePage.dart';
import 'package:my_first_app/pages/meteo/meteoPage.dart';
import 'package:my_first_app/pages/quiz/quizPage.dart';
class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("./images/profile.jpg"),
                radius: 50,
              ),
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white,Colors.deepOrange]
                )
            ),
          ),
          ListTile(
            title: Text("Home",style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
            },
          ),
          Divider(color: Colors.deepOrange),
          ListTile(
            title: Text("Quiz",style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.announcement),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizPage()));
            },
          ),
          Divider(color: Colors.deepOrange),
          ListTile(
            title: Text("Meteo",style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.ac_unit),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context){return MeteoPage();}));
            },
          ),
          Divider(color: Colors.deepOrange),
          ListTile(
            title: Text("Galerie",style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.markunread_mailbox),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>GalleryPage()));
            },
          ),
          Divider(color: Colors.deepOrange),
          ListTile(
            title: Text("Caméra",style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.camera_alt),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraPage()));
            },
          ),
          Divider(color: Colors.deepOrange),
        ],
      ),
    );
  }
}
