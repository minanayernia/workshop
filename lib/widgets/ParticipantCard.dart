import 'package:flutter/material.dart';

class ParticipantCard extends StatefulWidget {
  @override
  _ParticipantCardState createState() => _ParticipantCardState();
}

class _ParticipantCardState extends State<ParticipantCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 118,
      height: 72,
      margin: EdgeInsets.only(left: 10, top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            height: 60,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Colors.grey[300].withOpacity(0.8),
                borderRadius: BorderRadius.circular(10)),
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Text('Bahara'),
          ),
        ],
      ),
    );
  }
}
