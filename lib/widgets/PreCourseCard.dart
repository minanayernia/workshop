import 'package:flutter/material.dart';
import 'package:workshop/models/PreCourse.dart';
import 'package:workshop/models/workshop.dart';

class PreCorseCard extends StatefulWidget {
   String workshop;
   PreCorseCard({@required this.workshop});
  
  @override
  _PreCorseCardState createState() => _PreCorseCardState();
}

class _PreCorseCardState extends State<PreCorseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5 , right: 5),
      height: 20,
      width: 70,
      decoration: BoxDecoration(
          color: Colors.pinkAccent, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          widget.workshop,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
