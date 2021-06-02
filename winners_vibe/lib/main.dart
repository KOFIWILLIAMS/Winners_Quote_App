import 'package:custom_splash/custom_splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home.dart';

void main() {
  Function duringSplash = () {
    print('Something background process');
    int a = 123 + 23;
    print(a);

    if (a > 100)
      return 1;
    else
      return 2;
  };

  Map<int, Widget> op = {1: MyApp(), 2: MyApp()};

  runApp(MaterialApp(
    title: "Winners Quotes",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.brown,
        splashColor:Colors.brown ,
        backgroundColor: Colors.brown,
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,

        fontFamily: 'Josefin Sans'),
    home: CustomSplash(
      imagePath: "assets/images/firstlogo.png",
      backGroundColor: Colors.brown[700],
      // backGroundColor: Color(0xfffc6042),
     // new
      animationEffect: 'zoom-in',
      logoSize: 150,
      home: MyApp(),
      customFunction: duringSplash,
      duration: 3900,
      type: CustomSplashType.StaticDuration,
      outputAndHome: op,
    ),
  ));
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /// by force portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return  Home();
  }
}


