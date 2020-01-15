import 'package:flutter/material.dart';
import 'package:workshop/widgets/topbar.dart';
import 'package:workshop/widgets/workshop_card.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body:Center(
        child: Column(
          children: <Widget>[
            TopBar(foo: "search",) 
          ],
        ),
      ),
    );
  }
}