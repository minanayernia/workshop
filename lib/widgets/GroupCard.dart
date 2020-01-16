import 'package:flutter/material.dart';

class GroupCard extends StatefulWidget {
  @override
  _GroupCardState createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 30,
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.purple[900],
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Text('Group #1',
                style: TextStyle(color: Colors.white, fontSize: 12.0)),
          ),
          Container(
            width: 50,
            height: 20,
            margin: EdgeInsets.only(right: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.deepPurple[300].withOpacity(0.8),
                borderRadius: BorderRadius.circular(10)),
            child: Text('1|10',
                style: TextStyle(color: Colors.white, fontSize: 12.0)),
          ),
        ],
      ),
    );
  }
}
