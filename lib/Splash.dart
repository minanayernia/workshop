import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.redAccent,
      body: Center( 
        child:
        Column(children: <Widget>[
            
            CircleAvatar(child: Image.asset('assets/logo.png'), radius: 100,),
            RaisedButton(
              child: Text('home'),
              onPressed: 
                (){
                  // Navigator.pop(context);
                  // Navigator.pushNamed(context, '/home');
                  Navigator.popAndPushNamed(context, '/home');
                }
              )
          ],
          mainAxisAlignment: MainAxisAlignment.center,),
      
      ),
      
    );
  }
}