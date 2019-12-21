import 'package:flutter/material.dart';

class Mina extends StatefulWidget {
  @override
  _MinaState createState() => _MinaState();
}

class _MinaState extends State<Mina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Center(child: Text('home'),),
    );
  }
}