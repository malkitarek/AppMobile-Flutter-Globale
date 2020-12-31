import 'package:flutter/material.dart';
import 'package:my_first_app/pages/home/homePage.dart';

void main()=>runApp(MyApp());
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Login UI',
        theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.deepOrange)),
        debugShowCheckedModeBanner: false,
        home:HomePage()
    );
  }
}

