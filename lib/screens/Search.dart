import 'package:flutter/material.dart';
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
      appBar: AppBar(
      leading: IconButton(icon: Icon(Icons.search),onPressed: (){},),
      title: Text('search'),
      titleSpacing: 0,

      ),
      backgroundColor: Theme.of(context).accentColor,
      body:  MmdCard(),
    );
  }
}