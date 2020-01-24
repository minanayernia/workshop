import 'package:flutter/material.dart';
import 'package:workshop/widgets/GroupCard.dart';
import 'package:workshop/widgets/ParticipantCard.dart';
import 'package:workshop/widgets/TA_ImageCard.dart';
import 'package:workshop/widgets/background.dart';
import 'package:workshop/screens/workshop-details-supervisor.dart';
import 'package:workshop/models/Participant.dart';
import 'package:workshop/models/TA.dart';
import 'package:workshop/models/workshop.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workshop/models/PreCourse.dart';
import 'dart:convert';
import 'dart:async';
import 'package:workshop/models/Group.dart';
import 'package:workshop/models/user.dart';
class WorkshopDetailsTA extends StatefulWidget {
  Workshop workshop ;
  WorkshopDetailsTA({@required this.workshop}) ;
      

  @override
  _WorkshopDetailsTAState createState() => _WorkshopDetailsTAState();
}

class _WorkshopDetailsTAState extends State<WorkshopDetailsTA> {
  @override
  Widget build(BuildContext context) {
    final Workshop args = ModalRoute.of(context).settings.arguments;
    return Material(
      type: MaterialType.transparency,
      child: Scaffold(
        //       child: Stack(
        //   children: <Widget>[
        //     Background(),
        //     Page(),
        //   ],
        // ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/learnoo-pattern.png'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(child: Center(child: Page(workshop: args))),
        ),
      ),
    );
  }
}

class Page extends StatefulWidget {
  Workshop workshop ;
  Page({@required this.workshop}) ;
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Workshopimage(),
        CardDetail(workshop:widget.workshop),
        GroupDetails(),
        ParticipantDetails(),
        TADetails(),
      ],
    );
  }
}

class CardDetail extends StatefulWidget {
  Workshop workshop ;
  CardDetail({@required this.workshop}) ;
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
                      widget.workshop.supervisor != null ? widget.workshop.supervisor : "no name",
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
                      widget.workshop.date,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.timelapse,
                      color: Colors.white,
                    ),
                    Text(
                      widget.workshop.time,
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
                      widget.workshop.location,
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
                  width: MediaQuery.of(context).size.width * 0.9,
                  // child: ListView(
                  //   scrollDirection: Axis.horizontal,
                  //   children: <Widget>[
                  //     ParticipantCard(),
                  //     ParticipantCard(),
                  //     ParticipantCard(),

                  //   ],
                  // )

                  // child: ListView.builder(
                  //   scrollDirection: Axis.horizontal,
                  //   itemBuilder: (_, i) => ParticipantCard(prt: p[i]),
                  //   itemCount: p.length,
                  // ),
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
                        child: Text(participantlistta.length.toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0)),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width * 0.9,
                  // child: ListView(
                  //   scrollDirection: Axis.horizontal,
                  //   children: <Widget>[
                  //     ParticipantCard(),
                  //     ParticipantCard(),
                  //     ParticipantCard(),
                  //     ParticipantCard(),
                  //   ],
                  // ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, i) => ParticipantCard(user: participantlistta[i]),
                    itemCount: participantlistta.length,
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
                  width: MediaQuery.of(context).size.width * 0.9,
                  // child: ListView(
                  //   scrollDirection: Axis.horizontal,
                  //   children: <Widget>[
                  //     TAImageCard(),
                  //     TAImageCard(),
                  //     TAImageCard(),
                  //     TAImageCard(),
                  //   ],
                  // ),

                  // child: ListView.builder(
                  //   scrollDirection: Axis.horizontal,
                  //   itemBuilder: (_, i) => TAImageCard(user : t[i]),
                  //   itemCount: t.length,
                  // ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

List<User> participantlistta = [];
List<User> talistta = [] ;
List<User> grouptaparticipantlist = [] ;

Future<http.Response> getworkshopsup(int id) async {

  print(1122334455);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String tk = prefs.getString('token');
  participantlistta.clear();
  talistta.clear() ;
  grouptaparticipantlist.clear() ;
  
  Map data = {"id": id};
  var response = await http.post(
      'http://192.168.43.59:8080/api/v1/workshop/detailForTA',
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        "Authorization": "Bearer " + tk,
      },
      body: json.encode(data));
  print(response.body);

  for (int i = 0;
      i < json.decode(response.body)["participants"].length;
      i++) {
        User user = User() ;
        user.name = json.decode(response.body)["participants"][i]["name"] ;
        participantlistta.add(user) ;
    
    // print("well") ;
  }
  for (int i = 0;
      i < json.decode(response.body)["tas"].length;
      i++) {
        User user = User() ;
        user.name = json.decode(response.body)["tas"][i]["name"] ;
        talistta.add(user) ;
        
    
    // print("well") ;
  }


  for (int i = 0;
      i < json.decode(response.body)["group"]["tas"].length;
      i++) {
        User user = User() ;
        user.name = json.decode(response.body)["tas"][i]["name"] ;
        grouptaparticipantlist.add(user) ;
        
    
    // print("well") ;
  }
  
  print("fml");
  print(id);
  print(json.decode(response.body));

  // for (int i = 0; i < json.decode(response.body).length; i++) {}
  return response;
}
