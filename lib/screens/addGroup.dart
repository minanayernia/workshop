import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:workshop/models/user.dart';
// import 'package:workshop/screens/form.dart';
import 'package:workshop/widgets/topbar.dart';
import 'package:workshop/models/Participant.dart';
import 'package:workshop/models/TA.dart';
import 'package:workshop/models/workshop.dart';
import 'package:http/http.dart' as http;


int groupTAs ;
int groupParticipants ;
int selectedTAs = 0;
int selectedParticipants = 0;

Workshop thisWorkshop = Workshop();
List<int> acceptedTAs = [] ;
List<int> acceptedPar = [] ;




class AddGroupPage extends StatefulWidget {
  @override
  _AddGroupPageState createState() => _AddGroupPageState();
}

class _AddGroupPageState extends State<AddGroupPage> {
  @override
  Widget build(BuildContext context) {
    final Workshop args = ModalRoute.of(context).settings.arguments;
    thisWorkshop = args ;
    return FutureBuilder(
        future: getTAandParticipant(),
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
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          children: <Widget>[
            TopBar(
              foo: "Add Group",
            ),
            AddGroupBox(),
            SubmittButton(),
          ],
        ),
      ),
    );
          }
        });
    // return Scaffold(
    //   backgroundColor: Colors.deepPurple,
    //   body: Center(
    //     child: Column(
    //       children: <Widget>[
    //         TopBar(
    //           foo: "Add Group",
    //         ),
    //         AddGroupBox(),
    //         SubmittButton(),
    //       ],
    //     ),
    //   ),
    // );
  }
}

class AddGroupBox extends StatefulWidget {
  @override
  _AddGroupBoxState createState() => _AddGroupBoxState();
}

class _AddGroupBoxState extends State<AddGroupBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
          color: Colors.deepPurple[700],
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 7),
          ),
          Text(
            "Group#1",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Container(
            // color: Colors.red,
            height: 20,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 20,
                    child: Text(
                      "TAs",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 20,
                    child: Center(child: Text(groupTAs.toString())),
                    decoration: BoxDecoration(color: Colors.deepPurple , borderRadius: BorderRadius.circular(25)),
                  ),
                  Container(
                    width: 50,
                    height: 20,
                    decoration: BoxDecoration(color: Colors.deepPurple , borderRadius: BorderRadius.circular(25)),
                    child: Center(child: Text(selectedTAs.toString())),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 7),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 90,
            // decoration: BoxDecoration(color: Colors.red),
            // child: ListView(
            //   scrollDirection: Axis.horizontal,
            //   children: <Widget>[
            //     TACard(),
            //     TACard(),
            //     TACard(),
            //     TACard(),
            //     TACard(),
            //   ],
            // ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) => TACard(ta: allTAs[i]),
              itemCount: allTAs.length,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Container(
            // color: Colors.red,
            height: 20,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 20,
                    child: Text(
                      "Participants",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 20,
                    child: Center(child: Text(groupParticipants.toString())),
                    decoration: BoxDecoration(color: Colors.deepPurple , borderRadius: BorderRadius.circular(25)),
                  ),
                  Container(
                    width: 50,
                    height: 20,
                    decoration: BoxDecoration(color: Colors.deepPurple , borderRadius: BorderRadius.circular(25)),
                    child: Center(child: Text(selectedParticipants.toString())),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.8,
            // child: ListView(
            //   scrollDirection: Axis.vertical,
            //   children: <Widget>[
            //     ParticipantCard(),
            //     ParticipantCard(),
            //     ParticipantCard(),
            //     ParticipantCard(),
            //     ParticipantCard(),
            //     ParticipantCard(),
            //   ],
            // ),

            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (_, i) => ParticipantCard(prt: allParticipants[i]),
              itemCount: allParticipants.length,
            ),
          )
        ],
      ),
    );
  }
}

class TACard extends StatefulWidget {
  User ta;
  TACard({@required this.ta});
  @override
  _TACardState createState() => _TACardState();
}

class _TACardState extends State<TACard> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
         onTap: () {
            setState(() {
              selected = !selected;
              if (selected == true){
                selectedTAs++ ;
                acceptedTAs.add(widget.ta.id) ;
                print(selectedTAs);
              }if (selected == false){
                if(selectedTAs != -1){
                  selectedTAs-- ;
                  acceptedTAs.remove(widget.ta.id) ;
                }
              }
            });
          },
        child: Container(
        height: 70 ,
        // width: 150,
        decoration: BoxDecoration(
            color: selected == true
                ? Colors.greenAccent[400]
                : Colors.deepPurple[800],
            borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.only(right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 70,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 6),
            ),
            Text(widget.ta.name + "   " , style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
    );
  }
}

class SubmittButton extends StatefulWidget {
  @override
  _SubmittButtonState createState() => _SubmittButtonState();
}

class _SubmittButtonState extends State<SubmittButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 7),
      child: ButtonTheme(
          minWidth: MediaQuery.of(context).size.width * 0.9,
          height: 45,
          child: RaisedButton(
              child: Text(
                'Add Group',
                style: TextStyle(color: Colors.deepPurple[900], fontSize: 15.0),
              ),
              color: Colors.greenAccent[400],
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0),
              ),
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, '/home');
                sendTAandParticipant();
                Navigator.popAndPushNamed(context, '/home');
              })),
    );
  }
}

class ParticipantCard extends StatefulWidget {
  User prt;
  ParticipantCard({@required this.prt});

  @override
  _ParticipantCardState createState() => _ParticipantCardState();
}

class _ParticipantCardState extends State<ParticipantCard> {
  String selected = "+";
  // bool select = false ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width * 0.7,
      margin: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
          color: selected == "+" ? Colors.white : Colors.greenAccent[400],
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 7),
          ),
          Container(
            height: 70,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(15)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 7),
          ),
          Container(
            // height: ,
            width: MediaQuery.of(context).size.width * 0.45,
            child: Text(widget.prt.name),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (selected == "+") {
                  selected = "-";
                  acceptedPar.remove(widget.prt.id);
                } else {
                  selected = "+";
                  acceptedPar.add(widget.prt.id) ;
                }
              });
            },
            child: Container(
              height: 70,
              width: 40,
              decoration: BoxDecoration(
                  color: selected == '+' ? Colors.pinkAccent : Colors.white,
                  borderRadius: BorderRadius.circular(29)),
              child: Center(
                  child: Text(
                selected,
                style: TextStyle(
                    color: selected == '+' ? Colors.white : Colors.pinkAccent,
                    fontSize: 30),
              )),
            ),
          )
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////
///get TAs and Participants
///

List<User> allTAs = [] ;
List<User> allParticipants = [] ;

Future<http.Response> getTAandParticipant()async{
  allTAs.clear() ;
  allParticipants.clear() ;
  
  Map data = {'id': thisWorkshop.id} ;
  var response = await http.post('http://192.168.43.59:8080/api/v1/workshop/detail' ,
      headers: {"Accept": "application/json", "content-type": "application/json",
      } ,
      body: json.encode(data),
  );
  print("start getting");
  print(response.body) ;
  for (int i = 0 ; i < json.decode(response.body)["tas"].length ; i++){
    User tempPar = User() ;
    print("getting ta");
    tempPar.name = json.decode(response.body)["tas"][i]["name"] ;
    tempPar.id = json.decode(response.body)["tas"][i]["userId"];
    print(tempPar.name);
    // tempPar.token = json.decode(response.body)["tas"][i]["userId"] ;
    // print( tempPar.token) ;
    allParticipants.add(tempPar);
    

  }
  print("exit for") ;

  for (int i = 0 ; i < json.decode(response.body)["participants"].length ; i++){
    
    User tempTA = User() ;
    print("getting par");
    tempTA.name = json.decode(response.body)["participants"][i]["name"] ;
    tempTA.id = json.decode(response.body)["participants"][i]["userId"] ;
    // tempTA.token = json.decode(response.body)["participants"][i]["userId"] ;
    allTAs.add(tempTA) ;
  }

  return response ;
}

///////////////////////////////////////////////////////////////////////////////////////////////
///send selected TAs and Participants
///


Future<http.Response> sendTAandParticipant()async{
  print("first") ;
  print(acceptedTAs);
  Map<String, int> ta = {};
  for (int i =0; i<acceptedTAs.length;i++){
    Map pp = {"id": i};
    ta.addAll(pp);
  }
  print(ta);
  print("test4");
   Map data = {'id': thisWorkshop.id , 'tAList': acceptedTAs, 'participantList':acceptedPar} ;
  acceptedPar.clear();
  acceptedTAs.clear();
  var response = await http.post('http://192.168.43.59:8080/api/v1/workshop/group/create' ,
  headers: {"Accept": "application/json", "content-type": "application/json",
      } ,
      body: json.encode(data),

  ) ;
  print("yep") ;
  print(json.decode(response.body)) ;
  print("nop");
  return response ;
}
