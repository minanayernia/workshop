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
      body: FutureBuilder(
        future: getedovomi(),
        builder: (context, snapshot){
          switch (snapshot.connectionState){
            case ConnectionState.waiting:
              return AlertDialog(backgroundColor: Colors.transparent,content: Container(height: 100,width: 100, color: Colors.transparent,child: Center(child: CircularProgressIndicator(),),),);

              case ConnectionState.active:
              print("active");
               return Stack(children: <Widget>[
                Background(),
                Center(child: Container(child: CircularProgressIndicator(),
                height: 100,width: 100,),)
              ],);

              case ConnectionState.none:
              print("none");
               return Stack(children: <Widget>[
                Background(),
                Center(child: Container(child: CircularProgressIndicator(),
                height: 100,width: 100,),)
              ],);

              case ConnectionState.done:
              return SingleChildScrollView(
          child: Stack(
                      children: <Widget>[Background(),
                        Column(children: <Widget>[
              TopBar(
                foo: "Home",
              ),
              //  Padding(padding: EdgeInsets.only(top: 50),),
              Container(
                height: MediaQuery.of(context).size.height*0.9,
                width: MediaQuery.of(context).size.width*1.2,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                   itemBuilder: (_, i)=> MmdCard(mmdworkshop: wsh[i],),
                    itemCount: wsh.length,
                    
                  
                ),
              ),
              
            ])],
          ),
        );
          }
              
      
    
        }));
        
        
        
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

    );
  }
}
