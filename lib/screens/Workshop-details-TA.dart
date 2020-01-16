import 'package:flutter/material.dart';
import 'package:workshop/widgets/GroupCard.dart';
import 'package:workshop/widgets/ParticipantCard.dart';
import 'package:workshop/widgets/TA_ImageCard.dart';
import 'package:workshop/widgets/background.dart';
import 'package:workshop/screens/workshop-details-supervisor.dart';

class WorkshopDetailsTA extends StatefulWidget {
  @override
  _WorkshopDetailsTAState createState() => _WorkshopDetailsTAState();
}

class _WorkshopDetailsTAState extends State<WorkshopDetailsTA> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: <Widget>[
          Background(),
          Page(),
        ],
      ),
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
        CardDetail(),
        GroupDetails(),
        ParticipantDetails(),
        TADetails(),
      ],
    );
  }
}

class CardDetail extends StatefulWidget {
  @override
  _CardDetailState createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.deepPurple[700].withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.only(
            top: 15,
          ),
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    Text(
                      'Sat,05 Oct',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                    Text(
                      'bahar',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.time_to_leave,
                      color: Colors.white,
                    ),
                    Text(
                      'bahar',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.place,
                      color: Colors.white,
                    ),
                    Text(
                      'bahar',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    // Price(),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class GroupDetails extends StatefulWidget {
  @override
  _GroupDetailsState createState() => _GroupDetailsState();
}

class _GroupDetailsState extends State<GroupDetails> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 15),
          width: MediaQuery.of(context).size.width * 0.85,
          height: 130,
          decoration: BoxDecoration(
              color: Colors.deepPurple[700].withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          child: Container(
            margin: EdgeInsets.only(top: 5, left: 5),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('My Group',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0)),
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0)),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width*0.9,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      ParticipantCard(),
                      ParticipantCard(),
                      ParticipantCard(),

                    ],
                  )
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ParticipantDetails extends StatefulWidget {
  @override
  _ParticipantDetailsState createState() => _ParticipantDetailsState();
}

class _ParticipantDetailsState extends State<ParticipantDetails> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 15),
          width: MediaQuery.of(context).size.width * 0.85,
          height: 130,
          decoration: BoxDecoration(
              color: Colors.deepPurple[700].withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          child: Container(
            margin: EdgeInsets.only(top: 5, left: 5),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('Participants',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0)),
                      ),
                      Container(
                        width: 50,
                        height: 20,
                        margin: EdgeInsets.only(right: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple[300].withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('54',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0)),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width*0.9,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      ParticipantCard(),
                      ParticipantCard(),
                      ParticipantCard(),
                      ParticipantCard(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class TADetails extends StatefulWidget {
  @override
  _TADetailsState createState() => _TADetailsState();
}

class _TADetailsState extends State<TADetails> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 15),
          width: MediaQuery.of(context).size.width * 0.85,
          height: 130,
          decoration: BoxDecoration(
              color: Colors.deepPurple[700].withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          child: Container(
            margin: EdgeInsets.only(top: 5, left: 5),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('TAs',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0)),
                      ),
                      Container(
                        width: 50,
                        height: 20,
                        margin: EdgeInsets.only(right: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple[300].withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('5',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0)),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width*0.9,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      TAImageCard(),
                      TAImageCard(),
                      TAImageCard(),
                      TAImageCard(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
