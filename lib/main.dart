// import 'dart:js';

// import 'dart:js';

// import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:workshop/models/workshop.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:workshop/screens/AddForm.dart';
import 'package:workshop/screens/AddWorkshop.dart';
import 'package:workshop/screens/Course.dart';
import 'package:workshop/screens/Workshop-details-TA.dart';
import 'package:workshop/screens/WorkshopAccountor.dart';
import 'package:workshop/screens/intro1.dart';
import 'package:workshop/screens/intro2.dart';
import 'package:workshop/screens/login.dart';
import 'package:workshop/screens/notification.dart';
import 'package:workshop/screens/addGroup.dart';
import 'package:workshop/screens/form.dart';
import 'package:workshop/screens/instalments.dart';
import 'package:workshop/screens/intro1.dart';
import 'package:workshop/screens/intro2.dart';
import 'package:workshop/screens/login.dart';
import 'package:workshop/screens/payment.dart';
import 'package:workshop/screens/profile.dart';
import 'package:workshop/screens/signup.dart';
import 'package:workshop/screens/splash.dart';
import 'package:workshop/screens/home.dart';
import 'package:workshop/screens/workshop-details-supervisor.dart';
import 'package:workshop/screens/workshop-details.dart';
import 'screens/Search.dart';
// import 'screens/splash.dart';
// import 'screens/profile.dart';
// import 'screens/home.dart';
import 'screens/jobs.dart';
import 'screens/form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryIconTheme: IconThemeData(color: Colors.redAccent),
        primarySwatch: Colors.red,
        accentColor: Colors.deepPurple,
        appBarTheme: AppBarTheme(color: Colors.blueAccent, iconTheme: IconThemeData(color: Colors.redAccent))
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => MyHomePage(),
        '/profile' : (context) => Profile() ,
        '/jobs': (context) => Jobs() ,
        '/login': (context) => Login(),
        '/signup': (context) => SignUp(),
        '/workshop': (context) => Workshopdetails(),
        '/sup': (context) => WorkshopdetailsSupervisor(),
        '/ta': (context) => WorkshopDetailsTA(),
        '/intro1': (context) => FirstIntroPage(),
        '/intro2': (context) => SecondIntroPage(),
        '/add form': (context) => AddForm(),
        '/add workshop': (context) => AddWorkshop(),
        '/workshopAccountor': (context) => WorkshopAccountor(),
        '/course': (context) => Course(),
        '/form': (context) => FormPage(),
        '/payment': (context) => PaymentPage(),
        '/addGroup': (context) => AddGroupPage(),
        '/instalment': (context) => InstalmentPage(),
      },
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
    Jobs(),
    // Mina(),
    Search(),
    NotificationPage(),
    // Jobs(),
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
        bottomNavigationBar: Container(
          height: 71,
          padding: EdgeInsets.only(bottom: 10, right: 10, left: 10),
          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            child: BottomNavigationBar(
              // selectedIconTheme: IconThemeData(size:30),
              backgroundColor: Colors.white,
              currentIndex: _selectedIndex,
              type: BottomNavigationBarType.fixed,
              iconSize: 30,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('1'),
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), title: Text('2')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications), title: Text('3')),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                    ),
                    title: Text('4')),
                // BottomNavigationBarItem(icon: Icon(Icons.person,), title: Text('4')),
              ],
              onTap: _onItemTapped,
              unselectedItemColor: Colors.deepPurple[300],
              selectedItemColor: Colors.deepPurple[600],
              showUnselectedLabels: false,
              showSelectedLabels: false,
            ),
          ),
        ),
        body: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
