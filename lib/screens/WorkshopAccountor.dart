import 'package:flutter/material.dart';
import 'package:workshop/models/workshop.dart';
import 'package:workshop/screens/addGroup.dart';
import 'package:workshop/widgets/background.dart';
import 'package:workshop/screens/workshop-details.dart';
import 'package:workshop/widgets/profileCard.dart';
import 'package:workshop/models/Participant.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workshop/models/PreCourse.dart';
import 'dart:convert';
import 'dart:async';
import 'package:workshop/models/user.dart';

class WorkshopAccountor extends StatefulWidget {
  Workshop workshop;
  WorkshopAccountor({@required this.workshop});

  @override
  _WorkshopAccountorState createState() => _WorkshopAccountorState();
}
class _WorkshopAccountorState extends State<WorkshopAccountor> {
  @override
  void initState() {
    // TODO: implement initState
    // sendworkshopid(widget.workshop);
  }
  @override

  Widget build(BuildContext context) {
    final Workshop args = ModalRoute.of(context).settings.arguments;
    // print(args);
    // print("*******************************************");
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: <Widget>[
          Background(),
          Page(workshop: args),
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
        Workshopimage(
          workshop: widget.workshop,
        ),
        Detailcard(workshop: widget.workshop),
        TimePlcecard(workshop: widget.workshop),
        ParticipantCard(workshop: widget.workshop,),
      ],
    );
  }
}

class ParticipantCard extends StatefulWidget {
  Workshop workshop;
  ParticipantCard({this.workshop});
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
                      participantlist.length.toString(),
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
            // child: ListView.builder(
            //   scrollDirection: Axis.horizontal,
            //   itemBuilder: (_, i) => EachParticipantCard(eprt: p[i]),
            //   itemCount: p.length,
            // ),
            child: FutureBuilder(
                      future: getpartcipantlist(widget.workshop.id),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return AlertDialog(
                              backgroundColor: Colors.transparent,
                              content: Container(
                                height: 100,
                                width: 100,
                                color: Colors.transparent,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            );

                          case ConnectionState.active:
                            // print("active");
                            return Stack(
                              children: <Widget>[
                                // Background(),
                                Center(
                                  child: Container(
                                    child: CircularProgressIndicator(),
                                    height: 100,
                                    width: 100,
                                  ),
                                )
                              ],
                            );

                          case ConnectionState.none:
                            // print("none");
                            return Stack(
                              children: <Widget>[
                                // Background(),
                                Center(
                                  child: Container(
                                    child: CircularProgressIndicator(),
                                    height: 100,
                                    width: 100,
                                  ),
                                )
                              ],
                            );

                          case ConnectionState.done:
                            return SingleChildScrollView(
                              child: Stack(
                                children: <Widget>[
                                  Background(),
                                  Column(children: <Widget>[
                                    //  Padding(padding: EdgeInsets.only(top: 50),),
                                    Container(
                                      // color: Colors.red,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.11,
                                      width: MediaQuery.of(context).size.width *
                                          1.2,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (_, i) => EachParticipantCard(
                                          user: participantlist[i],
                                        ),
                                        itemCount: participantlist.length,
                                      ),
                                    ),
                                  ])
                                ],
                              ),
                            );
                        }
                      }),
            // child: EachParticipantCard(),
          ),
        ],
      ),
    );
  }
}

class EachParticipantCard extends StatefulWidget {
  User user ;
  EachParticipantCard({@required this.user}) ;
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
              widget.user.name,
              style: TextStyle(fontSize: 12.0, color: Colors.purple[600]),
            ),
          ),
        ],
      ),
    );
  }
}

// void sendworkshopid(Workshop workshop) {
//   Map data = {'offeredWorkshopId': workshop.id};
//   Future<http.Response> sendId() async {
//     var response = await http.post('http://192.168.43.59:8080/api/v1/signup',
//         body: json.encode(data),
//         headers: {
//           "Accept": "application/json",
//           "content-type": "application/json"
//         });

//     // String b = (json.decode(response.body[0]));
//     // prefs.setString("token", b);
//   }

//   sendId();
// }
// Navigator.pop(context);
// Navigator.pushNamed(context, '/home');

List<User> participantlist = [];

Future<http.Response> getpartcipantlist(int id) async {
  // print(11111111111111111);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String tk = prefs.getString('token');
  print(tk) ;
  participantlist.clear();
  print("fml fml fml fml");
  Map data = {"id": id};
  var response = await http.post('http://192.168.43.59:8080/api/v1/workshop/detailForParticipant',
  headers: {
    "Accept": "application/json",
    "content-type": "application/json",
    "Authorization": "Bearer " + tk,
  }, 
  body: json.encode(data)
  );

  // print(22222222);
  // // print(777777777777777777);
  print("fml");
  print(id);
  print(json.decode(response.body));

  for (int i = 0; i < json.decode(response.body)["participants"].length; i++) {
    User user = User();

    // print(json.decode(response.body)["list"][i]["offeredWorkshop"]);/////////////////////
    user.name = json.decode(response.body)["participants"][i]["name"];
    print("myyyaaaay");
    print(user.name);

    participantlist.add(user);
  }
  return response;
}
