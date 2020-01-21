// import 'dart:js';

import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:workshop/models/user.dart';
import 'package:workshop/models/workshop.dart';
import 'package:workshop/widgets/profileCard.dart';
import 'package:workshop/widgets/topbar.dart';
// import 'package:workshop/screens/splash.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // @override
  // void initState() {
  //   super.initState();
  //   get_req();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
          child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width * 0.9,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            // TopBar(foo: "Profile",),
            ProfileAppBar(),
            // PopupMenu(),
            Container(
                height: MediaQuery.of(context).size.height - 140,
                width: MediaQuery.of(context).size.width * 0.95,
                child: SingleChildScrollView(
                  child: FutureBuilder(
                      future: sendPersonDetail(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return AlertDialog(
                              backgroundColor: Colors.deepPurple,
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
                            print(
                                "fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");
                            print(boz.name);
                            return SingleChildScrollView(
                              child: Stack(
                                children: <Widget>[
                                  Column(children: <Widget>[
                                    //  Padding(padding: EdgeInsets.only(top: 50),),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.9,
                                      width: MediaQuery.of(context).size.width *
                                          1.2,
                                      child: SingleChildScrollView(
                                          child: ProCard(
                                        user: boz,
                                      )),
                                    ),
                                  ])
                                ],
                              ),
                            );
                        }
                      }),
                )),
          ],
        ),
      )),
    );
  }
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class ProfileAppBar extends StatefulWidget {
  @override
  _ProfileAppBarState createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  String menu = "...";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 8),
      height: 50,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 20),
              height: 30,
              // width:MediaQuery.of(context).size.width*0.8 ,
              child: Text(
                "Profile",
                style: TextStyle(color: Colors.deepPurple, fontSize: 20),
              )),
          // PopupMenuButton<WhyFarther>(itemBuilder: (context,),

          // ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/course') ;
            },
            child: Container(
              height: 24,
              margin: EdgeInsets.only(left: 220),
              child: Visibility(
                child: Icon(Icons.assignment , color: Colors.deepPurple, size: 20,),
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: true,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (menu == "...") {
                  menu = "x";
                } else {
                  menu = "...";
                }

                //             PopupMenuButton<CustomPopupMenu>(
                //   elevation: 3.2,
                //   initialValue: choices[1],
                //   onCanceled: () {
                //     print('You have not chossed anything');
                //   },
                //   tooltip: 'This is tooltip',
                //   onSelected: _select,
                //   itemBuilder: (BuildContext context) {
                //     return choices.map((CustomPopupMenu choice) {
                //       return PopupMenuItem<CustomPopupMenu>(
                //         value: choice,
                //         child: Text(choice.title),
                //       );
                //     }).toList();
                //   },
                // )
              });
            },
            // child: Center(
            //   child: Container(
            //     height: 30,
            //     width: 30,
            //     child: Text(
            //       menu,
            //       style: TextStyle(fontSize: 20, color: Colors.deepPurple),
            //     ),
            //   ),
            // ),
            child: PopupMenu(),
          )
        ],
      )),
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
        icon: Icon(
          Icons.more_vert,
          color: Colors.deepPurple,
        ),
        color: Colors.deepPurple.withOpacity(0.9),
        // shape: ShapeBorder.lerp(3, , 5),
        onSelected: (WhyFarther result) {
          setState(() {});
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
          const PopupMenuItem<WhyFarther>(
            value: WhyFarther.harder,
            child: Text(
              'Forms compeleted for you',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const PopupMenuItem<WhyFarther>(
            value: WhyFarther.smarter,
            child: Text('Forms compeleted by you',
                style: TextStyle(color: Colors.white)),
          ),
          const PopupMenuItem<WhyFarther>(
            value: WhyFarther.selfStarter,
            child: Text('Debts', style: TextStyle(color: Colors.white)),
          ),
          const PopupMenuItem<WhyFarther>(
            value: WhyFarther.tradingCharter,
            child: Text('Logout', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

User boz = User();

Future<http.Response> sendPersonDetail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String tk = prefs.getString("token");

  var response =
      await http.get('http://192.168.43.59:8080/api/v1/profile', headers: {
    "Authorization": "Bearer " + tk,
    "Accept": "application/json",
    "content-type": "application/json"
  });
  print("hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
  print(response.body);
  print(boz);
  boz.name = json.decode(response.body)["name"];
  boz.ncode = json.decode(response.body)["nationalCode"];
  boz.phone = json.decode(response.body)["phoneNumber"];

  print(boz);
  print(boz.name);

  return response;
}
