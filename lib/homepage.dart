import 'package:flutter/material.dart';
import 'package:weather/api.dart';
import 'openweather.dart';
class homepage extends StatefulWidget {
  static var city;
   homepage({Key? key}) : super(key: key);
  @override
  _homepageState createState() => _homepageState();
}
class _homepageState extends State<homepage> {  
  @override  
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: Container(
          padding: EdgeInsets.all(20),          
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("WEATHER APP",style: TextStyle(letterSpacing: 4,fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
              Container(
                height: 300,
                width: 300,
                child: Image(image: AssetImage('images/loading1.gif')),
              ),
              
              SizedBox(height:50),
              TextField(
                onSubmitted:(value){
                  setState(() {
                   homepage.city=value; 
                  });
                } ,
                onChanged: (value){
                 setState(() {
                  homepage.city=value; 
                 }); 
                },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Search",
                hintText: "Enter City"
              ),
              ),
              SizedBox(height:15),
              SizedBox(height: 50,
              width: double.infinity,
              child: ElevatedButton(                
                onPressed: (){
                  fetchWeather();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OpenWeather(homepage.city)));
              }, 
              child: Text("Search")),),
              
            ],
          ),
        ),
    ));
  }
}