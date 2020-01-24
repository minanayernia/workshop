import 'package:flutter/material.dart';
import 'package:workshop/main.dart';
import 'package:workshop/models/workshop.dart';
import 'package:workshop/screens/workshop-details.dart';
import 'package:workshop/widgets/background.dart';
import 'package:workshop/widgets/TA_ImageCard.dart';
import 'package:workshop/widgets/GroupCard.dart';
import 'package:workshop/widgets/ParticipantCard.dart';
import 'package:workshop/widgets/TARequestCard.dart';
import 'package:workshop/models/Group.dart';
import 'package:workshop/models/TA.dart';
import 'package:workshop/models/Request.dart';
import 'package:workshop/models/user.dart';
import 'package:workshop/models/Participant.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workshop/models/PreCourse.dart';
import 'dart:convert';
import 'dart:async';

class WorkshopdetailsSupervisor extends StatefulWidget {
  Workshop workshop;
  WorkshopdetailsSupervisor({@required this.workshop});
  @override
  _WorkshopdetailsSupervisorState createState() =>
      _WorkshopdetailsSupervisorState();
}

class _WorkshopdetailsSupervisorState extends State<WorkshopdetailsSupervisor> {
  @override
  Widget build(BuildContext context) {
    final Workshop args = ModalRoute.of(context).settings.arguments;

    return FutureBuilder(
        future: getworkshopsup(args.id),
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
              return Scaffold(
                // resizeToAvoidBottomInset: true,
                // resizeToAvoidBottomPadding: true,
                body: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/learnoo-pattern.png'),
                          fit: BoxFit.cover)),
                  child: SingleChildScrollView(
                      child: Center(
                          child: Page(
                    workshop: args,
                  ))),
                ),
              );
          }
        });
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
        Workshopimage(),
        Detailcard(workshop: widget.workshop),
        FormButton(),
        MyGroupDetail(workshop: widget.workshop,),
        TADetail(),
        ParticipantDetails(
          workshop: widget.workshop,
        ),
      ],
    );
  }
}

class Workshopimage extends StatefulWidget {
  @override
  _WorkshopimageState createState() => _WorkshopimageState();
}

class _WorkshopimageState extends State<Workshopimage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          width: 100,
          height: 100,
        )
      ],
    );
  }
}

class Detailcard extends StatefulWidget {
  Workshop workshop;
  Detailcard({@required this.workshop});
  @override
  _DetailcardState createState() => _DetailcardState();
}

class _DetailcardState extends State<Detailcard> {
  @override
  Widget build(BuildContext context) {
    print('injaaaaaaaa');
    print(widget.workshop);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
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
                      widget.workshop.supervisor != null
                          ? widget.workshop.supervisor
                          : " no name ",
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
                      Icons.time_to_leave,
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

class FormButton extends StatefulWidget {
  @override
  _FormButtonState createState() => _FormButtonState();
}

class _FormButtonState extends State<FormButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      width: MediaQuery.of(context).size.width * 0.9,
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
          Navigator.pushNamed(context, '/add form');
          // Navigator.popAndPushNamed(context, '/login');
        },
      ),
    );
  }
}

class MyGroupDetail extends StatefulWidget {
  Workshop workshop ;
  MyGroupDetail({@required this.workshop});
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
          width: MediaQuery.of(context).size.width * 0.9,
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
                width: MediaQuery.of(context).size.width * 0.9,
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
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.0)),
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
                            Navigator.pushNamed(context, '/addGroup' , arguments: widget.workshop);
                            // Navigator.popAndPushNamed(context, '/login');
                          },
                        )),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.deepPurple[700].withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)),
                // child: ListView(
                //   scrollDirection: Axis.horizontal,
                //   children: <Widget>[
                //     GroupCard(),
                //     GroupCard(),
                //     GroupCard(),
                //     GroupCard(),
                //     GroupCard(),
                //   ],
                // )

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) => GroupCard(group: grouplistsup[i]),
                  itemCount: grouplistsup.length,
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
          width: MediaQuery.of(context).size.width * 0.9,
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
                width: MediaQuery.of(context).size.width * 0.9,
                margin: EdgeInsets.only(left: 10),
                // child: ListView(
                //   scrollDirection: Axis.horizontal,
                //   children: <Widget>[
                //     TAImageCard(),
                //     TAImageCard(),
                //     TAImageCard(),
                //     TAImageCard(),
                //     TAImageCard(),
                //   ],
                // ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) => TAImageCard(
                    user: talistsup[i],
                  ),
                  itemCount: talistsup.length,
                ),
                height: 50,
              ),
              Container(
                alignment: Alignment.center,
                width: 80,
                margin: EdgeInsets.only(left: 10, top: 5),
                child:
                    Text(requestlistsup.length.toString() + " Requests", style: TextStyle(color: Colors.white)),
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                height: 70,
                width: MediaQuery.of(context).size.width * 0.9,
                // child: ListView(
                //   scrollDirection: Axis.horizontal,
                //   children: <Widget>[
                //     TARequestCard(),
                //     TARequestCard(),
                //     TARequestCard(),
                //   ],
                // )
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) => TARequestCard(
                    user: requestlistsup[i],
                  ),
                  itemCount: requestlistsup.length,
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
  Workshop workshop;
  ParticipantDetails({@required this.workshop});
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
                          participantlistsup.length.toString(),
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.9,
                // child: ListView(
                //   scrollDirection: Axis.horizontal,
                //   children: <Widget>[
                //     ParticipantCard(),
                //     ParticipantCard(),
                //     ParticipantCard(),
                //     ParticipantCard(),
                //   ],
                // )

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) => ParticipantCard(
                    user: participantlistsup[i],
                  ),
                  itemCount: participantlistsup.length,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

List<User> participantlistsup = [];
List<User> talistsup = [];
List<Group> grouplistsup = [];
List<User> requestlistsup = [];

Future<http.Response> getworkshopsup(int id) async {

  print(1122334455);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String tk = prefs.getString('token');
  grouplistsup.clear();
  participantlistsup.clear();
  talistsup.clear();
  requestlistsup.clear();
  Map data = {"id": id};
  var response = await http.post(
      'http://192.168.43.59:8080/api/v1/workshop/detailForSupervisor',
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        "Authorization": "Bearer " + tk,
      },
      body: json.encode(data));
  print(response.body);
  print("hereeeeeeeeeeeee");

  for (int i = 0;
      i < json.decode(response.body)["groups"]["groupDatas"].length;
      i++) {
    print('loop');
    
    Group group = Group();
    group.name = i.toString();
    group.participant = json
        .decode(response.body)["groups"]["groupDatas"][i]
            ["participants"]
        .length;
        // print('loop');
    print(group.participant);
    group.ta = json
        .decode(response.body)["groups"]["groupDatas"][i]["tAs"]
        .length;
        // print('loop');
    grouplistsup.add(group);
    // print("well") ;
  }
  

  // talistsup = json.decode(response.body)["acceptedRequests"];
  // requestlistsup = json.decode(response.body)["requests"];
//   print("t") ;
// print(json
//         .decode(response.body)["participants"]);
//         print("a") ;
  for (int i = 0;
      i <
          json
              .decode(response.body)["participants"]
              .length;
      i++) {
        print(json.decode(response.body)
        ["participants"]);
    User user = User();
    print("ti");
    user.name = json.decode(response.body)
        ["participants"][i]["name"];
       
    participantlistsup.add(user);
  }

print(json
              .decode(response.body)["acceptedRequests"]);

  for (int i = 0;
      i <
          json
              .decode(response.body)["acceptedRequests"]
              .length;
      i++) {
        
    User user = User();
    print("ti");
    user.name = json.decode(response.body)
        ["acceptedRequests"][i]["name"];
       
    talistsup.add(user);
  }



  for (int i = 0;
      i <
          json
              .decode(response.body)["requests"]
              .length;
      i++) {
        
    User user = User();
    print("ti");
    user.name = json.decode(response.body)
        ["requests"][i]["name"];
       
    requestlistsup.add(user);
  }
  // print(participantlistsup[0]);
  // print(22222222);
  // // print(777777777777777777);
  print("fml");
  print(id);
  print(json.decode(response.body));

  // for (int i = 0; i < json.decode(response.body).length; i++) {}
  return response;
}
