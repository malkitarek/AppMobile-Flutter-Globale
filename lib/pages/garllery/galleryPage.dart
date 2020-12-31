import 'package:flutter/material.dart';
import 'file:///E:/projets-Flutter/my_first_app/lib/pages/garllery/detailGarllery.dart';
class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  String keyword="";
  TextEditingController cityEditingController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Galerie de $keyword"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:  TextField(
                  decoration: InputDecoration(hintText: 'Taper une ville ..'),
                  controller: cityEditingController,
                  onChanged: (value){
                    setState(() {
                      keyword=value;
                    });
                  },
                  onSubmitted: (city){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailGarllery(city)));
                      cityEditingController.text="";
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  child: RaisedButton(
                      color: Colors.deepOrange,
                      textColor: Colors.white,
                      child: Text(
                        "Get Images ..",
                        style: TextStyle(fontSize: 22),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailGarllery(keyword)));
                        cityEditingController.text="";
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}
