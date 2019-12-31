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
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10)),

      
    );
  }
}