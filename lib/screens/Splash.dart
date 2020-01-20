// import 'dart:html';
// import '';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:workshop/main.dart';
import 'package:workshop/screens/intro1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:workshop/models/user.dart';




class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool has_token = false;
  bool is_new = true;
  String route;

  void get() async{
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
      if (!prefs.containsKey("new")){
        route = '/intro1';
        is_new = false;
        prefs.setBool("new", false);
        Timer(Duration(seconds: 3), () {Navigator.pushNamed(context, route);});
      }
      if (!prefs.containsKey("token")){
        route = '/signup';
      } else {
        route = '/home';
      }
    
      Timer(Duration(seconds: 3), () => {Navigator.pushNamed(context, route)});
      
  }

  @override
  void initState() {
    super.initState();
      get();}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/splash_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Learnoo_new.gif"))),
              child: Container(
                height: 50,
                width: 50,
                // child: RaisedButton(
                //   child: Text("home"),
                //   onPressed: () {
                //     Navigator.pushNamed(context, "/intro1");
                //   },
                // ),
              ),
            ),
          )),
    );
  }
}