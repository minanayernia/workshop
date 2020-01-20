// import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

import 'package:workshop/screens/AddWorkshop.dart';

String url = "192.168.43.59:8080";

class Workshop with ChangeNotifier {
  String about;
  List<Workshop> precourse;
  String picture;
  int id;
  String price;
  String name;
  int capacity;
  String supervisor;
  String location;
  String time;
  String date;

  Workshop({
    @required this.precourse,
    @required this.picture,
    @required this.name,
    @required this.capacity,
    @required this.supervisor,
    @required this.location,
    @required this.time,
    @required this.date,
    @required this.id,
    @required this.about,
    @required this.price,
  });
}

List<int> test = [1, 2, 3];

List<Workshop> wsh = [];

void getworkshops() {
  print(11111111111111111);
  Future<http.Response> getworkshops() async {
    var response = await http
        .post('http://192.168.43.59:8080/api/v1/workshop/list', headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });
    print(1122222222);
    print(json.decode(response.body));

    for (int i = 0; i < json.decode(response.body).length; i++) {
      Workshop workshop;

      workshop.name = json.decode(response.body)[i]["name"];
      workshop.supervisor = json.decode(response.body)[i]["supervisor"];
      workshop.capacity = json.decode(response.body)[i]["capacity"];
      workshop.location = json.decode(response.body)[i]["location"];
      workshop.time = json.decode(response.body)[i]["time"];
      workshop.id = json.decode(response.body)[i]["id"];
      workshop.date = json.decode(response.body)[i]["date"];
      workshop.precourse = json.decode(response.body)[i]["precourse"];
      workshop.about = json.decode(response.body)[i]["about"];
      workshop.price = json.decode(response.body)[i]["price"];

      wsh.add(workshop);
    }
  }

  ;
}
