import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

class Workshop with ChangeNotifier{
  int id ;
  String name;
  int capacity ;
  String supervisor;
  String location ;
  String time ;
  String date ;

  Workshop({
    @required this.name,
    @required this.capacity ,
    @required this.supervisor ,
    @required this.location ,
    @required this.time ,
    @required this.date ,
    @required this.id ,
    });

}

List<Workshop> wsh =[];

void getworkshops(){
  Future<http.Response> getworkshops() async{
    var response = await http.get('http://192.168.43.139:8080/api/v1/workshop/list',
    headers: {"Accept": "application/json", "content-type": "application/json"});

  for (int i = 0 ; i < json.decode(response.body).length ; i++ ){
    Workshop workshop;

    
    workshop.name = json.decode(response.body)[i]["name"];
    workshop.supervisor = json.decode(response.body)[i]["supervisor"];
    workshop.capacity = json.decode(response.body)[i]["capacity"];
    workshop.location = json.decode(response.body)[i]["location"];
    workshop.time = json.decode(response.body)[i]["time"];
    workshop.id = json.decode(response.body)[i]["id"];
    workshop.date = json.decode(response.body)[i]["date"];


    wsh.add(workshop);
  }

  };

  
   

}