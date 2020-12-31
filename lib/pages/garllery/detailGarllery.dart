import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class DetailGarllery extends StatefulWidget {
  String keyword;
  DetailGarllery(this.keyword);
  @override
  _DetailGalleryState createState() => _DetailGalleryState();
}

class _DetailGalleryState extends State<DetailGarllery> {
  int currentPage = 1;
  int size = 10;
  int totalePages;
  ScrollController scrollController=new ScrollController();
  List<dynamic> hits=[];
  var galleryData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData(widget.keyword);
    scrollController.addListener(() {
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
        if(currentPage<totalePages){
          ++currentPage;
          this.getData(widget.keyword);
        }
      }

    });

  }

  getData(keyword) {
    String url =
        "https://pixabay.com/api/?key=19186577-f3a04c1e7046b86b621de0cc1&q=$keyword&page=${currentPage}&per_page=${size}";
    http.get(url).then((response) {
      print(response.body);
      setState(() {
        galleryData = json.decode(response.body);
        hits.addAll(galleryData["hits"]) ;
        if(galleryData["totalHits"]%size==0){
          totalePages=galleryData["totalHits"]/size;
        }else{
          totalePages=(galleryData["totalHits"]~/size)+1;
        }
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gallery data de ${widget.keyword}",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: (galleryData == null
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: galleryData == null ? 0 : hits.length,
              controller: scrollController,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:10.0,right:10.0,top:10,bottom: 0),
                      child: Container(
                        width: double.infinity,
                        child: Card(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                hits[index]["tags"],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 0),
                        child: Card(
                          child: Image.network(hits[index]["webformatURL"]),
                        ))

                  ],
                );
              })),
    );
  }
}
