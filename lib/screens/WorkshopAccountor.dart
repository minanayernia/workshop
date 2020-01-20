import 'package:flutter/material.dart';
import 'package:workshop/models/workshop.dart';
import 'package:workshop/screens/addGroup.dart';
import 'package:workshop/widgets/background.dart';
import 'package:workshop/screens/workshop-details.dart';
import 'package:workshop/widgets/profileCard.dart';
import 'package:workshop/models/Participant.dart';

class WorkshopAccountor extends StatefulWidget {

   Workshop workshop;
   WorkshopAccountor({@required this.workshop});


  @override
  _WorkshopAccountorState createState() => _WorkshopAccountorState();
}

class _WorkshopAccountorState extends State<WorkshopAccountor> {
 

  @override
  Widget build(BuildContext context) {
    final Workshop args = ModalRoute.of(context).settings.arguments;
    print(args);
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: <Widget>[
          Background(),
          Page(workshop: args,),
        ],
      ),
    );
  }
}

class Page extends StatefulWidget {
  Workshop workshop;
   Page({@required this.workshop});

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: <Widget>[
        Workshopimage(workshop: widget.workshop,),
        Detailcard(workshop: widget.workshop),
        TimePlcecard(workshop: widget.workshop),
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
      height: 130,
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
            height: 80,
            width: MediaQuery.of(context).size.width * 0.85,

            margin: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 10),
            // child: ListView(
            //   scrollDirection: Axis.horizontal,
            //   children: <Widget>[
            //     EachParticipantCard(),
            //     EachParticipantCard(),
            //     EachParticipantCard(),
            //     EachParticipantCard(),
            //   ],
            // ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) => EachParticipantCard(eprt: p[i]),
              itemCount: p.length,
            ),
            // child: EachParticipantCard(),
          ),
        ],
      ),
    );
  }
}

class EachParticipantCard extends StatefulWidget {
  Participant eprt;
  EachParticipantCard({@required this.eprt});
  @override
  _EachParticipantCardState createState() => _EachParticipantCardState();
}

class _EachParticipantCardState extends State<EachParticipantCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 72,
      margin: EdgeInsets.only(right: 10),
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
            child: Text(
              'bahar',
              style: TextStyle(fontSize: 12.0, color: Colors.purple[600]),
            ),
          ),
        ],
      ),
    );
  }
}
