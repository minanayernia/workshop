import 'package:flutter/material.dart';
import 'package:workshop/models/user.dart';
import 'package:workshop/screens/addGroup.dart';
import 'package:workshop/models/Participant.dart';

class ParticipantCard extends StatefulWidget {
  User user ; 
  ParticipantCard({@required this.user});
  @override
  _ParticipantCardState createState() => _ParticipantCardState();
}

class _ParticipantCardState extends State<ParticipantCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 128,
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
            child: Text(widget.user.name + "   " , style: TextStyle(color: Colors.deepPurple),),
          ),
        ],
      ),
    );
  }
}
