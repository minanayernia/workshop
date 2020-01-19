// import 'dart:js';

import 'package:image_picker/image_picker.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:workshop/widgets/profileCard.dart';
import 'package:workshop/widgets/topbar.dart';
// import 'package:workshop/screens/splash.dart';
import 'package:http/http.dart' as http;

class CustomPopupMenu {
  CustomPopupMenu({this.title, this.icon});

  String title;
  IconData icon;
}

List<CustomPopupMenu> choices = <CustomPopupMenu>[
  CustomPopupMenu(title: 'Home', icon: Icons.home),
  CustomPopupMenu(title: 'Bookmarks', icon: Icons.bookmark),
  CustomPopupMenu(title: 'Settings', icon: Icons.settings),
];

class SelectedOption extends StatelessWidget {
  CustomPopupMenu choice;

  SelectedOption({Key key, this.choice}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 140.0, color: Colors.white),
            Text(
              choice.title,
              style: TextStyle(color: Colors.white, fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
     get_req() ;
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          children: <Widget>[
            // TopBar(foo: "Profile",),
            ProfileAppBar(),
            Container(
                height: MediaQuery.of(context).size.height - 140,
                width: MediaQuery.of(context).size.width * 0.95,
                child: SingleChildScrollView(child: ProCard())),
          ],
        ),
      ),
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
              setState(() {
                if (menu == "...") {
                  menu = "X";
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
            child: Container(
              height: 30,
              width: 30,
              child: Text("..."),
            ),
          )
        ],
      )),
    );
  }
}

class MinaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MinaAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        height: 100,
        child: Center(
          child:
              //     child: Container(

              // height: 50,
              // width: MediaQuery.of(context).size.width * 0.9,
              // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              //  color: Colors.yellow
              //  ),
              // child:
              Container(
            height: 20,
            child: AppBar(
              backgroundColor: Colors.green,

              title: Container(
                child: Text('PROFILE'),
              ),

              automaticallyImplyLeading: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(200),
                  bottom: Radius.circular(200),
                ),
              ),
              // ),
            ),
          ),
        ));
  }
}

class PopupMenuButton extends StatefulWidget {
  @override
  _PopupMenuButtonState createState() => _PopupMenuButtonState();
}

class _PopupMenuButtonState extends State<PopupMenuButton> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void get_req() async {
  Future<http.Response> sendPersonDetail() async {
    var response = await http.get('http://192.168.43.139:8080/api/v1/signup',
        headers: {
          "Authorization" : "Bearer " + "",
          "Accept": "application/json",
          "content-type": "application/json"
        });
  }
}
