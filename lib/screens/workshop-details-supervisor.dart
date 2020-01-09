import 'package:flutter/material.dart';
import 'package:workshop/main.dart';
import 'package:workshop/screens/workshop-details.dart';
import 'package:workshop/widgets/background.dart';
import 'package:workshop/widgets/TA_ImageCard.dart';
import 'package:workshop/widgets/GroupCard.dart';
import 'package:workshop/widgets/ParticipantCard.dart';
import 'package:workshop/widgets/TARequestCard.dart';

class WorkshopdetailsSupervisor extends StatefulWidget {
  @override
  _WorkshopdetailsSupervisorState createState() =>
      _WorkshopdetailsSupervisorState();
}

class _WorkshopdetailsSupervisorState extends State<WorkshopdetailsSupervisor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      // resizeToAvoidBottomPadding: true,
         body: Container(
                 height: MediaQuery.of(context).size.height,
                 decoration: BoxDecoration(
                   image: DecorationImage(image: AssetImage('assets/learnoo-pattern.png'),
                   fit: BoxFit.cover)
          ),
                 child: SingleChildScrollView(child: Center(child:Page())),
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
        Detailcard(),
        FormButton(),
        MyGroupDetail(),
        TADetail(),
        ParticipantDetails(),
      ],
    );
  }
}

class Detailcard extends StatefulWidget {
  @override
  _DetailcardState createState() => _DetailcardState();
}

class _DetailcardState extends State<Detailcard> {
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

class FormButton extends StatefulWidget {
  @override
  _FormButtonState createState() => _FormButtonState();
}

class _FormButtonState extends State<FormButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      width: MediaQuery.of(context).size.width * 0.85,
      height: 37,
      child: RaisedButton(
        child: Text(
          'Add Form',
          style: TextStyle(color: Colors.deepPurple[900], fontSize: 17.0),
        ),
        color: Colors.greenAccent[400],
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0),
        ),
        onPressed: () {
          // Navigator.pop(context);
          // Navigator.pushNamed(context, '/home');
          // Navigator.popAndPushNamed(context, '/login');
        },
      ),
    );
  }
}

class MyGroupDetail extends StatefulWidget {
  @override
  _MyGroupDetailState createState() => _MyGroupDetailState();
}

class _MyGroupDetailState extends State<MyGroupDetail> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: 90,
          decoration: BoxDecoration(
              color: Colors.deepPurple[700].withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.only(
            top: 15,
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.deepPurple[700].withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('My Group',
                      style: TextStyle(color: Colors.white , fontSize: 15.0)),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 20,
                        margin: EdgeInsets.only(right: 10),
                        child: RaisedButton(
                          child: Text(
                            '+',
                            style: TextStyle(
                                color: Colors.red[900], fontSize: 17.0),
                          ),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                          ),
                          onPressed: () {
                            // Navigator.pop(context);
                            // Navigator.pushNamed(context, '/home');
                            // Navigator.popAndPushNamed(context, '/login');
                          },
                        )),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    color: Colors.deepPurple[700].withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: <Widget>[
                          GroupCard() ,
                      ],
                    ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class TADetail extends StatefulWidget {
  @override
  _TADetailState createState() => _TADetailState();
}

class _TADetailState extends State<TADetail> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 15),
          height: 190,
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
              color: Colors.deepPurple[700].withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                child: Text('TAs',
                    style: TextStyle(color: Colors.white, fontSize: 15.0)),
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child:Row(children: <Widget>[
                  TAImageCard(),
                ],),
                height: 50,
              ),
              Container(
                alignment: Alignment.center,
                width: 80,
                margin: EdgeInsets.only(left: 10 , top: 5),
                child:
                    Text('5 Requests', style: TextStyle(color: Colors.white)),
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                height: 70,
                child: Row(
                  children: <Widget>[
                      TARequestCard() ,
                  ],
                ),
              ),
            ],
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
          height: 130,
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
              color: Colors.deepPurple[700].withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('Participants',
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.0)),
                    ),
                    Container(
                        width: 60,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple[300],
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          '53',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
              Container(
                height: 100,
                child: Row(
                  children: <Widget>[
                      ParticipantCard(),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
