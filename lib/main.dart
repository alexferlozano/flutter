import 'package:flutter/material.dart';
import 'package:my_app/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Mi app empleado",
      theme: ThemeData(
        primaryColor: Colors.orange),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
    );
  }
}