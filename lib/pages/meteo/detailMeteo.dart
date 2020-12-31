import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
class DetailMeteo extends StatefulWidget {
  String city;
  DetailMeteo(this.city);
  @override
  _DetailMeteoState createState() => _DetailMeteoState();
}

class _DetailMeteoState extends State<DetailMeteo> {
  var weatherData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(widget.city);
  }
  getData(String city){
   String url="https://community-open-weather-map.p.rapidapi.com/forecast?q=${city}&rapidapi-key=62d00cda49mshf7c96d813a28137p1b9703jsnf01637c88652";
   http.get(url).then((response) {
     print(response.body);
     setState(() {
       weatherData=json.decode(response.body);
     });
   }).catchError((err){
      print(err);
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meteo de ${widget.city}"),
      ),
      body: (weatherData==null?
        Center(
          child: CircularProgressIndicator(),
        )
       :ListView.builder(
          itemCount: (weatherData==null?0:weatherData["list"].length),
          itemBuilder: (context,index){
            return Card(
              color: Colors.deepOrange,

              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("./images/${weatherData["list"][index]["weather"][0]["main"]}.jpg"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${new DateFormat("E dd/MM/yyyy").format(DateTime.fromMillisecondsSinceEpoch(weatherData["list"][index]['dt']*1000)) }",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold)),
                              Text("${new DateFormat("HH:mm").format(DateTime.fromMillisecondsSinceEpoch(weatherData["list"][index]['dt']*1000)) }"
                                  "|${weatherData["list"][index]["weather"][0]["main"]}",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text("${(weatherData["list"][index]['main']['temp']/10).round()}C°",style: TextStyle(fontSize: 22,color:Colors.white,fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            );
      })
    )
    );
  }
}
