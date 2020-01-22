import 'package:flutter/material.dart';
import 'package:workshop/main.dart';
import 'package:workshop/models/PreCourse.dart';
import 'package:workshop/models/TA.dart';
import 'package:workshop/models/user.dart';
import 'package:workshop/widgets/TA_ImageCard.dart';
import 'package:workshop/widgets/background.dart';
import 'package:workshop/screens/workshop-details.dart';
import 'package:workshop/widgets/PreCourseCard.dart';
import 'package:workshop/models/workshop.dart';
import 'package:workshop/widgets/PreCourseCard.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workshop/models/PreCourse.dart';
import 'dart:convert';
import 'dart:async';

class Workshopdetails extends StatefulWidget {
  Workshop currentWorkshop;
  Workshopdetails({@required this.currentWorkshop});
  @override
  _WorkshopdetailsState createState() => _WorkshopdetailsState();
}

class _WorkshopdetailsState extends State<Workshopdetails> {
  @override
  Widget build(BuildContext context) {
    // print(widget.currentWorkshop);

    final Workshop args = ModalRoute.of(context).settings.arguments;
    print(args);
    print("###################################################");

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(),
          ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Page(currentWorkshop: args),
            ],
          )
        ],
      ),
    );
  }
}

class Page extends StatefulWidget {
  Workshop currentWorkshop;
  Page({@required this.currentWorkshop});
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Workshopimage(
          workshop: widget.currentWorkshop,
        ),
        Detailcard(
          workshop: widget.currentWorkshop,
        ),
        TimePlcecard(
          workshop: widget.currentWorkshop,
        ),
        Enrollbutton(workshop : widget.currentWorkshop),
        TAcard(),
      ],
    );
  }
}

class Workshopimage extends StatefulWidget {
  Workshop workshop;
  Workshopimage({@required this.workshop});

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
          //////////////////////////////////////////////////////////////////////////////////

          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          width: 100,
          height: 100,
          child: Center(
              child: Text(widget.workshop.picture != null
                  ? widget.workshop.picture
                  : "+")),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 15),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    widget.workshop.name != null
                        ? widget.workshop.name
                        : " no name ",
                    style: TextStyle(color: Colors.purple, fontSize: 30.0),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    widget.workshop.supervisor != null
                        ? widget.workshop.supervisor
                        : " no name ",
                    style: TextStyle(color: Colors.purple[300], fontSize: 20.0),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Prerequisite',
                    style: TextStyle(color: Colors.purple[200], fontSize: 15.0),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 20,
                    // child: ListView(
                    //   scrollDirection: Axis.horizontal,
                    //   children: <Widget>[
                    //     PreCorseCard(),
                    //     PreCorseCard(),
                    //     PreCorseCard(),
                    //     PreCorseCard(),
                    //     PreCorseCard(),
                    //   ],
                    // ),
                    // child: ListView.builder(
                    //   scrollDirection: Axis.horizontal,
                    //   itemBuilder: (_, i) =>
                    //       PreCorseCard(workshop: widget.workshop.precourse[i]),
                    //   itemCount: widget.workshop.precourse.length,
                    // ),
                    child: FutureBuilder(
                        future: getedovomi(),
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
                              print("active");
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
                              print("none");
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
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.9,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.2,
                                        child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (_, i) => PreCorseCard(
                                            workshop:
                                                widget.workshop.precourse[i],
                                          ),
                                          itemCount:
                                              widget.workshop.precourse.length,
                                        ),
                                      ),
                                    ])
                                  ],
                                ),
                              );
                          }
                        }),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    child: Text(
                      widget.workshop.about != null
                          ? widget.workshop.about
                          : " no name ",
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class TimePlcecard extends StatefulWidget {
  Workshop workshop;
  TimePlcecard({@required this.workshop});
  @override
  _TimePlcecardState createState() => _TimePlcecardState();
}

class _TimePlcecardState extends State<TimePlcecard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 160,
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
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                        widget.workshop.date,
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.time_to_leave,
                      color: Colors.white,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                        widget.workshop.time,
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.place,
                      color: Colors.white,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                        widget.workshop.location,
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        height: 35,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.people,
                              color: Colors.white,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                widget.workshop.capacity.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                            )
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Container(
                            height: 35,
                            child: Price(workshop: widget.workshop))),
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

class Enrollbutton extends StatefulWidget {
  Workshop workshop ;
  Enrollbutton({@required this.workshop}) ;
  @override
  _EnrollbuttonState createState() => _EnrollbuttonState();
}

class _EnrollbuttonState extends State<Enrollbutton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: RaisedButton(
        child: Text(
          'Enroll',
          style: TextStyle(color: Colors.deepPurple[900], fontSize: 17.0),
        ),
        color: Colors.greenAccent[400],
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0),
        ),
        onPressed: () {
          // Navigator.pop(context);
          Navigator.pushNamed(context, '/payment', arguments: widget.workshop);
          // arguments: widget.workshop ;
          // Navigator.popAndPushNamed(context, '/login');
        },
      ),
    );
  }
}

class TAcard extends StatefulWidget {
  @override
  _TAcardState createState() => _TAcardState();
}

class _TAcardState extends State<TAcard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 170,
          decoration: BoxDecoration(
              color: Colors.deepPurple[700].withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'TAs',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    Container(
                      height: 80,
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
                      //   itemBuilder: (_, i) => TAImageCard(ta: t[i]),
                      //   itemCount: t.length,
                      // ),
                      child: FutureBuilder(
                      future: getpartcipantlist(),
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
                            print("active");
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
                            print("none");
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.9,
                                      width: MediaQuery.of(context).size.width *
                                          1.2,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (_, i) => TAImageCard(
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
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Requestbutton(),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Requestbutton extends StatefulWidget {
  @override
  _RequestbuttonState createState() => _RequestbuttonState();
}

class _RequestbuttonState extends State<Requestbutton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: MediaQuery.of(context).size.width * 0.8,
        height: 37,
        child: RaisedButton(
            child: Text(
              'Request',
              style: TextStyle(color: Colors.deepPurple[900], fontSize: 15.0),
            ),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(35.0),
            ),
            onPressed: () {
              // Navigator.pop(context);
              // Navigator.pushNamed(context, '/home');
              Navigator.popAndPushNamed(context, '/login');
            }));
  }
}

class Price extends StatefulWidget {
  Workshop workshop;
  Price({@required this.workshop});

  @override
  _PriceState createState() => _PriceState();
}

class _PriceState extends State<Price> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 30,
      child: Center(
        child: Text(
          widget.workshop.price.toString(),
          style: TextStyle(color: Colors.deepPurple[900], fontSize: 30.0),
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(25),
        color: Colors.white,
      ),
    );
  }
}


 
            
            void sendworkshopid(Workshop workshop){
              Map data = {'workshopId': workshop.id };
             Future<http.Response> sendId() async{
               var response = 
                await http.post('http://192.168.43.59:8080/api/v1/signup',
                body: json.encode(data) ,
                headers: {"Accept": "application/json", "content-type": "application/json"} 
                );

                
                
                // String b = (json.decode(response.body[0]));
                // prefs.setString("token", b);
        
             }
             sendId();
            }
                  // Navigator.pop(context);
                  // Navigator.pushNamed(context, '/home');
                  
                



List<User> participantlist = [];

Future<http.Response> getpartcipantlist() async {
  // print(11111111111111111);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String tk = prefs.getString('token');
  participantlist.clear();
  var response = await http.get(
      'http://192.168.43.59:8080/api/v1/detailForParticipant',
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        "Authorization": "Bearer " + tk,
      });

  // print(22222222);
  // print(777777777777777777);
  print(json.decode(response.body));

  for (int i = 0; i < json.decode(response.body)["participants"].length; i++) {
    User user = User();
    // print("aidaaaaaaaaaaaaaaaaaaaaaaaaaaa");

    // print(json.decode(response.body)["list"][i]["offeredWorkshop"]);/////////////////////
    user.name = json.decode(response.body)["participants"][i]["name"] ;
    

    participantlist.add(user);
  }
  return response;
}


////////////////////////////////////////////////////////////////////////
///send user and workshop to make participant
///

