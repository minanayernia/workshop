import 'package:flutter/material.dart';
import 'package:workshop/widgets/topbar.dart';
import 'package:workshop/widgets/workshop_card.dart';
import 'package:workshop/widgets/mmd.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      body: Center(
=======
      body:Center(
>>>>>>> b2556869288a686293311249be311dd160f2b187
        child: Column(
          children: <Widget>[
            TopBar(
              foo: "search",
            )
          ],
        ),
      ),
      backgroundColor: Theme.of(context).accentColor,
    );
  }
}
