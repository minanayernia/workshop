// import 'dart:html';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:workshop/models/user.dart';
import 'package:workshop/screens/AddForm.dart';
import 'package:workshop/screens/workshop-details.dart';
import 'package:workshop/widgets/PreCourseCard.dart';
import 'package:workshop/widgets/topbar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:workshop/models/PreCourse.dart';
import 'package:workshop/models/workshop.dart';
import 'package:http/http.dart' as http;

TextEditingController workshopName = TextEditingController();
TextEditingController aboutWorkshop = TextEditingController();
TextEditingController location = TextEditingController();
TextEditingController capacity = TextEditingController();
TextEditingController workshopPrice = TextEditingController();
TextEditingController startDate = TextEditingController();
TextEditingController endDate =TextEditingController();
TextEditingController startTime = TextEditingController();
TextEditingController endTime = TextEditingController();
User supervisor = User() ;
List<Workshop> preWorkshops = [] ;
User sup = User(name:"mina nayernia" ,ncode:"2282895304" ,phone:"09334262617" );

// List<S>

class AddWorkshop extends StatefulWidget {
  // Workshop workshop;
  // AddWorkshop({@required this.workshop});
  @override
  _AddWorkshopState createState() => _AddWorkshopState();
}

class _AddWorkshopState extends State<AddWorkshop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Center(
            child: Column(
              children: <Widget>[
                TopBar(
                  foo: "Add workshop",
                ),
                SingleChildScrollView(
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                    },
                    child: Page(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Page extends StatefulWidget {
  // Workshop wokshop;
  // Page({@required this.wokshop});
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        WorkshopInfo(),
        WorkshopDtailCard(),
        SchedualCard(),
        SubmitButton(),
      ],
    );
  }
}

class WorkshopInfo extends StatefulWidget {
  @override
  _WorkshopInfoState createState() => _WorkshopInfoState();
}

class _WorkshopInfoState extends State<WorkshopInfo> {
  File _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    // var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              getImage();
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.18,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: _image == null
                  ? Icon(
                      Icons.add_a_photo,
                      color: Colors.deepPurple,
                    )
                  : Image.file(_image),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 28,
                  margin: EdgeInsets.only(left: 10, top: 5),
                  child: Container(
                    margin: EdgeInsets.only(left: 10, top: 5),
                    child: TextField(
                      controller: workshopName,
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Workshop Name',
                          hintStyle: TextStyle(
                              color: Colors.deepPurple, fontSize: 15)),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.65,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 28,
                  width: MediaQuery.of(context).size.width * 0.65,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          'Super Visor',
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                      // Container(
                      //   height: 28,
                      //   margin: EdgeInsets.only(right: 10, top: 2.5),
                      //   child: Text(
                      //     '...',
                      //     style:
                      //         TextStyle(color: Colors.deepPurple, fontSize: 15),
                      //   ),
                      // ),
                      PopupMenu(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WorkshopDtailCard extends StatefulWidget {
  // Workshop workshop;
  // WorkshopDtailCard({@required this.workshop});
  @override
  _WorkshopDtailCardState createState() => _WorkshopDtailCardState();
}

class _WorkshopDtailCardState extends State<WorkshopDtailCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              'Details',
              style: TextStyle(color: Colors.purple[700], fontSize: 17.0),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Prerquisite',
                    style: TextStyle(color: Colors.purple[800], fontSize: 12.0),
                  ),
                ),
                Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width * 0.55,
                  // child: ListView(
                  //   scrollDirection: Axis.horizontal,
                  //   children: <Widget>[
                  //     PreCorseCard(),
                  //     PreCorseCard(),
                  //     PreCorseCard(),
                  //     PreCorseCard(),
                  //     PreCorseCard(),
                  //     PreCorseCard(),
                  //     PreCorseCard(),
                  //   ],
                  // ),
                  //   child: ListView.builder(
                  //   scrollDirection: Axis.horizontal,
                  //   itemBuilder: (_, i) => PreCorseCard(workshop: widget.workshop.precourse[i]),
                  //   itemCount: widget.workshop.precourse.length,
                  // ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 55,
                    height: 22,
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        '+',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 130,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10)),
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: TextField(
                controller: aboutWorkshop,
                textInputAction: TextInputAction.go,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'About Workshop ...',
                    hintStyle:
                        TextStyle(color: Colors.purple.withOpacity(0.5))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SchedualCard extends StatefulWidget {
  @override
  _SchedualCardState createState() => _SchedualCardState();
}

class _SchedualCardState extends State<SchedualCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 235,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.purple,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 80,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      child: TextField(
                        controller: startDate,
                        textInputAction: TextInputAction.go,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Start Date',
                            hintStyle: TextStyle(
                                color: Colors.purple.withOpacity(0.5), fontSize: 15)),
                      ),
                    ),
                  ),
                 // Container(
                    // margin: EdgeInsets.only(left: 10),
                    // width: 60,
                    // height: 35,
                    // child: RaisedButton(
                    //   child: Text(
                    //     '+',
                    //     style: TextStyle(color: Colors.white, fontSize: 30.0),
                    //   ),
                    //   color: Colors.pinkAccent,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: new BorderRadius.circular(20.0),
                    //   ),
                    //   onPressed: () {},
                    // ),
                    
                  //),

                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 80,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: endDate,
                        textInputAction: TextInputAction.go,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'End Date',
                            hintStyle: TextStyle(
                                color: Colors.purple.withOpacity(0.5), fontSize: 15)),
                      ),
                    ),
                  ),
                ],
              )),
          Container(
            padding: EdgeInsets.only(left: 10, top: 5),
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.timelapse,
                    color: Colors.purple,
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(left: 10, top: 5),
                //   width: 60,
                //   height: 35,
                //   child: RaisedButton(
                //     child: Text(
                //       '+',
                //       style: TextStyle(color: Colors.white, fontSize: 30.0),
                //     ),
                //     color: Colors.pinkAccent,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: new BorderRadius.circular(20.0),
                //     ),
                //     onPressed: () {},
                //   ),
                // ),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 80,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: startTime,
                        textInputAction: TextInputAction.go,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'startTime',
                            hintStyle: TextStyle(
                                color: Colors.purple.withOpacity(0.5), fontSize: 15)),
                      ),
                    ),
                  ),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 80,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: endTime,
                        textInputAction: TextInputAction.go,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'endTime',
                            hintStyle: TextStyle(
                                color: Colors.purple.withOpacity(0.5), fontSize: 15)),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, top: 5),
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.location_on,
                    color: Colors.purple,
                  ),
                ),
                Container(
                  height: 35,
                  margin: EdgeInsets.only(left: 10, top: 5),
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: location,
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Location' , hintStyle: TextStyle(color: Colors.purple.withOpacity(0.5))),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.circular(15),
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, top: 5),
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.people,
                    color: Colors.purple,
                  ),
                ),
                Container(
                  height: 35,
                  margin: EdgeInsets.only(left: 10, top: 5),
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: capacity,
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Capacity' , hintStyle: TextStyle(color: Colors.purple.withOpacity(0.5))),
                    ),
                  ),
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.circular(15),
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, top: 5),
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.monetization_on,
                    color: Colors.purple,
                  ),
                ),
                Container(
                  height: 35,
                  margin: EdgeInsets.only(left: 10, top: 5),
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: workshopPrice,
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'price' , hintStyle: TextStyle(color: Colors.purple.withOpacity(0.5))),
                    ),
                  ),
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.circular(15),
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class SubmitButton extends StatefulWidget {
  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width * 0.9,
      child: RaisedButton(
        child: Text(
          'Submit',
          style: TextStyle(color: Colors.deepPurple[900], fontSize: 15.0),
        ),
        color: Colors.greenAccent[400],
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0),
        ),
        onPressed: () {
          addWorkshop();
          Navigator.pushNamed(context, '/home');
        },
      ),
    );
  }
}

class PopupMenu extends StatefulWidget {
  @override
  _PopupMenuState createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PopupMenuButton(
        padding: EdgeInsets.only(bottom: 1),
        icon: Icon(
          Icons.more_horiz,
          size: 20,
          color: Colors.deepPurple,
        ),
        color: Colors.white,
        onSelected: (WhyFarther result) {
          setState(() {
            // getAllUsers();
          });
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
          const PopupMenuItem<WhyFarther>(
            value: WhyFarther.harder,
            child: Text(
              'Dr Hamze',
              style: TextStyle(color: Colors.deepPurple),
            ),
          ),
          const PopupMenuItem<WhyFarther>(
            value: WhyFarther.smarter,
            child: Text('Dr Ghare', style: TextStyle(color: Colors.deepPurple)),
          ),
          const PopupMenuItem<WhyFarther>(
            value: WhyFarther.selfStarter,
            child: Text('Dr sami', style: TextStyle(color: Colors.deepPurple)),
          ),
          const PopupMenuItem<WhyFarther>(
            value: WhyFarther.tradingCharter,
            child:
                Text('Dr Keshti', style: TextStyle(color: Colors.deepPurple)),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
//for getting all the users

List<User> allUsers = [] ;

Future<http.Response> getAllUsers() async{

  var response = await http.get(
        'http://192.168.43.59:8080/api/v1/allUsers',
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
        });
      print(json.decode(response.body));
      for (int i = 0 ; i < json.decode(response.body).length ; i++ ){
        User user = User() ;

        user.name = json.decode(response.body)[i]["name"] ;
        allUsers.add(user);
      }
      return response ;

}
/////////////////////////////////////////////////////////////////////////////////////////////
//for sending workshop



Future<http.Response> addWorkshop() async{
  
 Map data = {'workshopName' : workshopName.text , 'capacity' : int.parse(capacity.text), 'about' : aboutWorkshop.text ,
            'price' : int.parse(workshopPrice.text), 'location' : location.text , 'startTime' :startTime.text ,'endTime': endTime.text, 'startDate' : startDate.text ,
            'endDate' : endDate.text , 'supervisor' : {"name": sup.name, "userId":1, "nationalCode": sup.ncode} , 'preWorkshops' : []};

  var response = await http.post('http://192.168.43.59:8080/api/v1/workshop/add',
            body: json.encode(data) ,
            headers: {
                          "Accept": "application/json",
                          "content-type": "application/json",
                      }
                  )  ;
                  print("mina");
                  print(response.body);
                  print("mmd");

  }
