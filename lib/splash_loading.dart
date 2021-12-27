import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:weather/homepage.dart';
class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: homepage(),
      duration: 4000,
      imageSrc: 'images/loader.gif',
      imageSize: 150,
      backgroundColor:Colors.grey[100]
    );
  }
}