import 'package:flutter/material.dart';
import 'splash_loading.dart';
void main(){
  runApp(const Myapp());  
}
class Myapp extends StatefulWidget {
 const  Myapp({Key? key}) : super(key: key);
  @override
  _MyappState createState() => _MyappState();
}
class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const  Splash(),
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primarySwatch: Colors.grey,
      )
    );
  }
}

