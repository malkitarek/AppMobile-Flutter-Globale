import 'package:flutter/material.dart';
import 'package:my_first_app/mainDrawer.dart';
import 'package:my_first_app/pages/camera/cameraPage.dart';
import 'package:my_first_app/pages/garllery/galleryPage.dart';
import 'package:my_first_app/pages/meteo/meteoPage.dart';
import 'package:my_first_app/pages/quiz/quizPage.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homeTab = ['Méteo', 'Quiz', 'Galerie', 'Caméra'];
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text("My home page"),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: GridView.builder(
                        itemCount: 4,
                        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 480 / 700),
                        itemBuilder: (BuildContext context, int index) {
                          return new GestureDetector(
                            onTap: () {
                              if (index == 0)
                                return Navigator.push(context, MaterialPageRoute(builder: (context)=>MeteoPage()));
                              else if (index == 1)
                                return Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizPage()));
                              else if (index == 2)
                                return Navigator.push(context, MaterialPageRoute(builder: (context)=>GalleryPage()));
                              else
                                return Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraPage()));
                            },
                            child: new Card(
                                color: Colors.red,
                                elevation: 5.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("./images/homeImage$index.png"),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text("${homeTab[index]}",
                                        style: TextStyle(fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),),
                                    )
                                  ],
                                )
                            ),
                          );
                        }),
                  ),
                )
              ],
            )),
      );
    }
  }

