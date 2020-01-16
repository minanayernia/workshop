import 'package:flutter/material.dart';
import 'package:workshop/widgets/NotificationCard.dart';
import 'package:workshop/widgets/topbar.dart';

import 'form.dart';


class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text('NOTIFICATION'),
        leading: Icon(Icons.ac_unit),
        actions: <Widget>[Icon(Icons.wb_sunny)],
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          NotifCard(),
          NotifCard(),
        ],
      ),

     

      
     
      
    );
  }
}
