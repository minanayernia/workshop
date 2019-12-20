import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:workshop/profile.dart';
import 'package:workshop/splash.dart';
import 'package:workshop/home.dart';
import 'Search.dart';
import 'splash.dart';
import 'profile.dart';
import 'jobs.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blueGrey,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => SplashScreen(),
        '/home' : (context) => MyHomePage(),
        //'/profile' : (context) => Profile() ,
        //'/jobs': (context) => Jobs() ,
      }
      ,
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;
  
  final List<Widget> _widgetOptions = <Widget>[
    Mina(),
    Search(),
    Jobs(),
   Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return WillPopScope(
      onWillPop: () async => false,
          child: Scaffold(
        backgroundColor: Theme.of(context).accentColor,

  bottomNavigationBar: ClipRRect(
  
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
        child: BottomNavigationBar(
          selectedIconTheme: IconThemeData(size:40),
          backgroundColor: Colors.orangeAccent,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home ), title: Text('1'), ),
            BottomNavigationBarItem(icon: Icon(Icons.search ), title: Text('2')),
            BottomNavigationBarItem(icon: Icon(Icons.work ), title: Text('3')),
            BottomNavigationBarItem(icon: Icon(Icons.person,), title: Text('4')),
          ],
          onTap: _onItemTapped ,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.black,
          showUnselectedLabels: false,
          showSelectedLabels: false,
        ),
      ),
  body: Container(
      
  child: _widgetOptions.elementAt(_selectedIndex) ,
  ) ,
  
          

      ),
    );
    }
}
