import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

import 'package:workshop/models/user.dart';

class Participant with ChangeNotifier{

  String name ; 


  Participant({
    @required this.name});

}

List<Participant> p = [];
void getparticipant() {
  print(11111111111111111);
  Future<http.Response> getparticipant() async {
    var response = await http
        .post('http://192.168.43.59:8080/api/v1/workshop/list', headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });
    print(1122222222);
    print(json.decode(response.body));


    User participant ; 
    participant.name = json.decode(response.body)["name"];

    
  }
  ;
}