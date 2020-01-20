import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:workshop/widgets/mmd.dart';
import 'package:workshop/widgets/topbar.dart';
import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:workshop/models/workshop.dart';

String url = "192.168.43.59:8080";

class Jobs extends StatefulWidget {
  @override
  _JobsState createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  @override
  void initState() {
    super.initState();
    getworkshops();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          TopBar(
            foo: "Home",
          ),
          RaisedButton(
            color: Colors.red,
            child: Text(
                "bbbbbbbbbbbbbbbbbbbooooooooooooooooooooooozzzzzzzzzzzzzzzzzzz"),
            onPressed: () {
              getworkshops();
            },
          ),
          //  Padding(padding: EdgeInsets.only(top: 50),),
          Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width * 1.2,
              // child: ListView.builder(
              //   scrollDirection: Axis.vertical,
              //   itemBuilder: (_, i) => MmdCard(
              //     mmdworkshop: wsh[i],
              //   ),
              //   itemCount: wsh.length,
              // ),
              child: WorkshopCard()),
        ]),
      ),
    );
  }
}

class AddWorkshopButton extends StatefulWidget {
  @override
  _AddWorkshopButtonState createState() => _AddWorkshopButtonState();
}

class _AddWorkshopButtonState extends State<AddWorkshopButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 200,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/systemmanagercard.png'),
      )),
      child: Center(
          child: Text(
        'Add Workshop',
        style: TextStyle(fontSize: 30, color: Colors.deepPurple),
      )),
    );
  }
}

class AddButton extends StatefulWidget {
  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 70),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.pinkAccent, borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text(
        '+',
        style: TextStyle(color: Colors.white, fontSize: 20),
      )),
    );
  }
}

class WorkshopCard extends StatefulWidget {
  @override
  _WorkshopCardState createState() => _WorkshopCardState();
}

class _WorkshopCardState extends State<WorkshopCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
                alignment: Alignment.topCenter, child: AddWorkshopButton()),
            Container(alignment: Alignment.topLeft, child: AddButton()),
          ],
        ),
      ),
    );
  }
}
