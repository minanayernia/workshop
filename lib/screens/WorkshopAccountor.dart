import 'package:flutter/material.dart';
import 'package:workshop/widgets/background.dart';
import 'package:workshop/screens/workshop-details.dart';
import 'package:workshop/widgets/profileCard.dart';

class WorkshopAccountor extends StatefulWidget {
  @override
  _WorkshopAccountorState createState() => _WorkshopAccountorState();
}

class _WorkshopAccountorState extends State<WorkshopAccountor> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Background(),
        Page(),
      ],
    );
  }
}

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Workshopimage(),
        Detailcard(),
        TimePlcecard(),
        ParticipantCard(),
      ],
    );
  }
}

class ParticipantCard extends StatefulWidget {
  @override
  _ParticipantCardState createState() => _ParticipantCardState();
}

class _ParticipantCardState extends State<ParticipantCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 120,
      decoration: BoxDecoration(
          color: Colors.deepPurple[700].withOpacity(0.5),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Participants',
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ),
                Container(
                    width: 60,
                    height: 20,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple[300],
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      '53',
                      style: TextStyle(color: Colors.white, fontSize: 10.0),
                    )),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  EachParticipantCard(),
                ],
              )),
        ],
      ),
    );
  }
}

class EachParticipantCard extends StatefulWidget {
  @override
  _EachParticipantCardState createState() => _EachParticipantCardState();
}

class _EachParticipantCardState extends State<EachParticipantCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 72,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 5),
            width: 52,
            height: 62,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(15),
              color: Colors.grey[200],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text('bahar' , 
            style: TextStyle(fontSize: 12.0 , color: Colors.purple[600]),),
          ),
        ],
      ),
    );
  }
}
