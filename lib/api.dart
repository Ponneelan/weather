import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'homepage.dart';
class Weather{
  final double temp;
  final double max_temp;
  final double min_temp;
  final double feels_like;
  final double wind_speed;
  final String mainw;
  final String icon;
  final String name;
  final int sunset;
  final int sunrise;
  final int humidity;
  final String country;
  final int pressure;
  final int visibility;
  Weather({
   required this.humidity,
   required this.sunrise,
   required this.sunset,
   required this.temp,
   required this.icon,
   required this.name,
   required this.min_temp,
   required this.max_temp,
   required this.feels_like,
   required this.wind_speed,
   required this.mainw,
   required this.country,
   required this.pressure,   
   required this.visibility,
   }
   );
  factory Weather.fromJson(Map<String,dynamic>json){
    return Weather(
      temp: json['main']['temp'],
      max_temp: json['main']['temp_max'],
      min_temp:json['main']['temp_min'],
      feels_like: json['main']['feels_like'],
      wind_speed: json['wind']['speed'],
      mainw: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
      name:json['name'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      country: json['sys']['country'],
      visibility: json['visibility'],     
      );
  }
}

Future<Weather> fetchWeather() async{   
    var apiId='Your api ID';
    final response =await http.get(Uri.parse('http://api.openweathermap.org/data/2.5/weather?q=${homepage.city}&APPID=${apiId}'));
    if (response.statusCode==200){               
       return Weather.fromJson(jsonDecode(response.body)) ;          
    }
    else {
      throw Exception("Error");
    }
      }


