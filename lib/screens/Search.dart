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
      body: Center(
        child: Column(
          children: <Widget>[
            SearchAppBar(),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).accentColor,
    );
  }
}

class SearchAppBar extends StatefulWidget {
  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 8),
      height: 50,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Container(
        height: 30,
        width: MediaQuery.of(context).size.width * 0.8,
        margin: EdgeInsets.only(left: 20 , bottom: 5),
        child: TextField(
          cursorColor: Colors.deepPurple,
          textInputAction: TextInputAction.go,
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.deepPurple , fontSize: 20.0),
          decoration:
              InputDecoration(border: InputBorder.none, hintText: 'Search' , 
              hintStyle: TextStyle(color: Colors.deepPurple) ),
        ),
      ),
    );
  }
}
