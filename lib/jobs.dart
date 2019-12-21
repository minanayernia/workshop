import 'package:flutter/material.dart';
import 'package:workshop/mmd.dart';

class Jobs extends StatefulWidget {
  @override
  _JobsState createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('JOBS'),leading: Icon(Icons.ac_unit),actions: <Widget>[Icon(Icons.wb_sunny)],),
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
              child: Column(children: <Widget>[
          //  Padding(padding: EdgeInsets.only(top: 50),),
           MmdCard(),
           MmdCard(),
           MmdCard(),
           MmdCard(),
           MmdCard(),
           MmdCard(),
           MmdCard(),
           MmdCard(),
           MmdCard(),
           MmdCard(),
           MmdCard(),
           MmdCard(),
        ]),
      ),
    );
  }
}