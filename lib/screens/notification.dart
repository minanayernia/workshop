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
        backgroundColor: Theme.of(context).accentColor,
        body: Center(
          child: Column(
            children: <Widget>[
              TopBar(
                foo: "Notification",
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height-140,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    NotifCard(),
                    NotifCard(),
                    NotifCard(),
                    NotifCard(),
                    NotifCard(),
                    NotifCard(),
                    NotifCard(),
                    NotifCard(),
                    NotifCard(),
                    NotifCard(),
                    NotifCard(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
