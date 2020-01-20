
import 'package:flutter/material.dart';
import 'package:workshop/models/workshop.dart';

class WorkshopDetailCardTA extends StatefulWidget {
  Workshop workshop ;
  WorkshopDetailCardTA({@required this.workshop}) ;

  @override
  _WorkshopDetailCardTAState createState() => _WorkshopDetailCardTAState();
}

class _WorkshopDetailCardTAState extends State<WorkshopDetailCardTA> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        Navigator.pushNamed(context, '/ta', arguments: widget.workshop);
      },
      child: Container(
        // color: Colors.purple,
        // width: 100,
        height: 150,
        margin: EdgeInsets.only(right: 10),
        child: Stack(
          children: <Widget>[
            Container(
              width: 100,
              height: 125,
              // padding: EdgeInsets.only(top: 20),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.deepPurple[700],
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                  ),
                  Text(widget.workshop.name, style: TextStyle(color: Colors.white)),
                  Text(widget.workshop.date, style: TextStyle(color: Colors.white)),
                  Text(widget.workshop.time, style: TextStyle(color: Colors.white)),
                  Text(widget.workshop.supervisor, style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            // Padding(padding: EdgeInsets.only(top: 5),),
            Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(left: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image:
                        DecorationImage(image: AssetImage('assets/py.png')))),
          ],
        ),
      ),
    );
  }
}