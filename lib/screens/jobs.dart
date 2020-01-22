import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workshop/widgets/background.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(child: TopBar(foo: "Home",)),
              Container(
                height: MediaQuery.of(context).size.height*0.8,
                width: MediaQuery.of(context).size.width*0.9,
                child: Column(
                  children: <Widget>[
                    WorkshopCard(),
              SingleChildScrollView(
                              child: Container(
                                height: MediaQuery.of(context).size.height*0.6,
                                width: MediaQuery.of(context).size.width*0.9,
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
                  Background(),
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
                  Background(),
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
            return Container(
                height: MediaQuery.of(context).size.height*0.8,
                width: MediaQuery.of(context).size.width*0.9,
                  child: Container(
                          height: MediaQuery.of(context).size.height * 0.95,
                          width: MediaQuery.of(context).size.width * 1.2,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (_, i) => MmdCard(
                                mmdworkshop: wsh[i],
                            ),
                            itemCount: wsh.length,
                          ),
                        )
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                //   ListView(
                //   scrollDirection: Axis.vertical,
                //                     children: <Widget>[
                //                        Stack(
                //     children: <Widget>[
                //       // Background(),
                //       Column(children: <Widget>[
                        
                //         // WorkshopCard(),
                //         //  Padding(padding: EdgeInsets.only(top: 50),),
                //         Container(
                //           height: MediaQuery.of(context).size.height * 0.9,
                //           width: MediaQuery.of(context).size.width * 1.2,
                //           child: ListView.builder(
                //             scrollDirection: Axis.vertical,
                //             itemBuilder: (_, i) => MmdCard(
                //               mmdworkshop: wsh[i],
                //             ),
                //             itemCount: wsh.length,
                //           ),
                //         ),
                //       ])
                //     ],
                //   ),
                //                     ],
                // ),
            );
        }
                  }),
                              ),
              ),
                  ],
                ),
              )
              

            ],
          
          ));
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
      margin: EdgeInsets.only(top: 70 ,left: 5),
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
      onTap: () {
        Navigator.pushNamed(context, '/add workshop');
      },
      child: Container(
        child: Visibility(
          maintainAnimation: true,
          maintainState: true,
          visible: true,
          child: Container(
            // color: Colors.red,
            height: 100,
            child: Stack(
              
                children: <Widget>[
                  Container(
                    // height: 100,
                      alignment: Alignment.topCenter, child: AddWorkshopButton()),
                  // Container(alignment: Alignment.topLeft, child: AddButton()),
                ],
              ),
          ),
        ),
      ),
    );
  }
}
