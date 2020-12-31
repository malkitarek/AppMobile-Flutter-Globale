import 'package:flutter/material.dart';
import 'file:///E:/projets-Flutter/my_first_app/lib/pages/meteo/detailMeteo.dart';

class MeteoPage extends StatefulWidget {
  @override
  _MeteoPageState createState() => _MeteoPageState();
}

class _MeteoPageState extends State<MeteoPage> {
  String city="";
  TextEditingController cityEditingController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Meteo de $city"),
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
                      city=value;
                    });
                  },
                  onSubmitted: (city){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailMeteo(city)));
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
                        "Get wheather ..",
                        style: TextStyle(fontSize: 22),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailMeteo(city)));
                        cityEditingController.text="";
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}
