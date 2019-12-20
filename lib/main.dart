import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        centerTitle: true,
        title: Text('AppName'),
        backgroundColor: Colors.orangeAccent,
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20),
      ),
        )
    ),
    bottomNavigationBar: CurvedNavigationBar(
      buttonBackgroundColor:Colors.orangeAccent,
      animationDuration: Duration(milliseconds: 400),
    backgroundColor: Colors.red,
    color: Colors.orangeAccent,
    items: <Widget>[
      Icon(Icons.home, size: 20),
      Icon(Icons.search, size: 20),
      Icon(Icons.person, size: 20),
    ],
    onTap: (index) {
      //Handle button tap
    },
  ),
  body: Container(color: Colors.red ,
  child: Text('home page'),) ,
        

    );
    }
}
