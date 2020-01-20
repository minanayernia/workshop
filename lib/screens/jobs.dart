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
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    setState(() {
      getworkshops();
    });
    for(int i=0;i<1000;i++){
      setState(() {
        print(1);
      });
    }
    super.didChangeDependencies();
  }
  @override
  void initState() {
    
    setState(() {
    getworkshops();
    });
    super.initState();
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
            child: Text("bbbbbbbbbbbbbbbbbbbooooooooooooooooooooooozzzzzzzzzzzzzzzzzzz"),
            onPressed: (){
              
              getworkshops();
              
              setState(() {
                int a;
              });
            },
            
          ),
          RaisedButton(
            color: Colors.grey,
            child: Text("bbbbbbbbbbbbbbbbbbbooooooooooooooooooooooozzzzzzzzzzzzzzzzzzz"),
            onPressed: (){
              setState(() {
                int a;
              });
            },
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


      
      
    );
  }
}
