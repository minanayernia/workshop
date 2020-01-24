// import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workshop/models/PreCourse.dart';
import 'dart:convert';
import 'dart:async';
import 'package:workshop/screens/AddWorkshop.dart';

String url = "192.168.43.59:8080";

class Workshop with ChangeNotifier {
  String about;
  List<String> precourse = [];
  String picture;
  int id;
  int price;
  String name;
  int capacity;
  String supervisor;
  String location;
  String time;
  String date;

  Workshop({
    this.precourse,
    this.picture,
    this.name,
    this.capacity,
    this.supervisor,
    this.location,
    this.time,
    this.date,
    this.id,
    this.about,
    this.price,
  });
}

List<int> test = [1, 2, 3];

List<Workshop> wsh = [];
List<Workshop> participantWorkshops = [];
List<Workshop> supervisorWorkshops = [];
List<Workshop> taWorkshops = [];
List<Workshop> prelist = [] ;

// void getworkshops() {

Future<http.Response> getedovomi() async {
  wsh.clear();
  
  var response = await http
      .get('http://192.168.43.59:8080/api/v1/workshop/list', headers: {
    "Accept": "application/json",
    "content-type": "application/json"
  });
  print("bahr");
  print(json.decode(response.body).length);


  for (int i = 0; i < json.decode(response.body).length; i++) {
    print(i);
    Workshop workshop = Workshop();
    workshop.id = json.decode(response.body)[i]["offeredWorkshop"]["offeredWorkshopId"];
    workshop.supervisor = json.decode(response.body)[i]["supervisor"]["name"];
    workshop.capacity = json.decode(response.body)[i]["offeredWorkshop"]["capacity"];
    workshop.location = json.decode(response.body)[i]["offeredWorkshop"]["location"];
    workshop.time = json.decode(response.body)[i]["offeredWorkshop"]["startTime"];
    workshop.name = json.decode(response.body)[i]["offeredWorkshop"]["workshop"]["workshopName"];
    workshop.date = json.decode(response.body)[i]["offeredWorkshop"]["startDate"];
    // print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') ;
    // if (json.decode(response.body)[i]["preRequisite"] != []){
    //   print(json.decode(response.body)[i]["preRequisite"]);
    // for(int j = 0 ; j < json.decode(response.body)[i]["preRequisite"].length ; j++){
    //   // print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') ;
    //   workshop.precourse.add(json.decode(response.body)[i]["preRequisite"][j]["workshopName"]);
    // }}
    workshop.precourse = [];
    workshop.price = json.decode(response.body)[i]["offeredWorkshop"]["price"];

    wsh.add(workshop);
    // print(workshop);
      }
  return response;
}

//   getedovomi();

// }
// Future<http.Response> getParticipantList() async {
//    wsh.clear();
//     var response = await http.get('http://192.168.43.59:8080/api/v1/workshop/listAsParticipant', headers: {
//       "Accept": "application/json",
//       "content-type": "application/json"
//     });


Future<http.Response> getsuplist() async {
  print(11111111111111111);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String tk = prefs.getString('token');
  supervisorWorkshops.clear();
  var response = await http.get(
      'http://192.168.43.59:8080/api/v1/workshop/listAsSupervisor',
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        "Authorization": "Bearer " + tk,
      });

  print(22222222);
  // print(777777777777777777);
  print(json.decode(response.body));


  for (int i = 0; i < json.decode(response.body)["list"].length; i++) {
    Workshop workshop = Workshop();
    // print("aidaaaaaaaaaaaaaaaaaaaaaaaaaaa");

    // print(json.decode(response.body)["list"][i]["offeredWorkshop"]);/////////////////////
    workshop.id = json.decode(response.body)["list"][i]["offeredWorkshop"]["offeredWorkshopId"];
    // print(4);
    workshop.supervisor = json.decode(response.body)["list"][i]["supervisor"]["name"];
    // print(5);
    workshop.capacity = json.decode(response.body)["list"][i]["offeredWorkshop"]["capacity"];
    // print(6);
    workshop.location = json.decode(response.body)["list"][i]["offeredWorkshop"]["location"];
    // print(7);
    workshop.time = json.decode(response.body)["list"][i]["offeredWorkshop"]["startTime"];
    // print(8);
    workshop.name = json.decode(response.body)["list"][i]["offeredWorkshop"]["workshop"]["workshopName"];
    // print(9);
    workshop.date = json.decode(response.body)["list"][i]["offeredWorkshop"]["startDate"];
    // print(10);
    // workshop.precourse = json.decode(response.body)[i]["precourse"];
    // workshop.about = json.decode(response.body)[i]["about"];
    workshop.price = json.decode(response.body)["list"][i]["offeredWorkshop"]["price"];
    // print(11);

    supervisorWorkshops.add(workshop);
    print(workshop);
  }
  return response;
}

Future<http.Response> getParticipantWorkshops() async{
  participantWorkshops.clear();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String tk = prefs.getString('token');
//  participantWorkshops.clear();
    var response = await http.get(
        'http://192.168.43.59:8080/api/v1/workshop/listAsParticipant',
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": "Bearer " + tk,
        });
    // print(1122222222);
    print(json.decode(response.body));

    for (int i = 0; i < json.decode(response.body)["list"].length; i++) {
      Workshop workshop = Workshop();

      // print(333);
      workshop.id = json.decode(response.body)["list"][i]["offeredWorkshop"]["offeredWorkshopId"];
      // print(4);
      workshop.supervisor = json.decode(response.body)["list"][i]["supervisor"]["name"];
      // print(5);
      workshop.capacity = json.decode(response.body)["list"][i]["offeredWorkshop"]["capacity"];
      // print(6);
      workshop.location = json.decode(response.body)["list"][i]["offeredWorkshop"]["location"];
      // print(7);
      workshop.time = json.decode(response.body)["list"][i]["offeredWorkshop"]["startTime"];
      // print(8);
      workshop.name = json.decode(response.body)["list"][i]["offeredWorkshop"]["workshop"]["workshopName"];
      // print(9);
      workshop.date = json.decode(response.body)["list"][i]["offeredWorkshop"]["startDate"];
      // print(10);
      // workshop.precourse = json.decode(response.body)[i]["precourse"];
      // workshop.about = json.decode(response.body)[i]["about"];
      workshop.price = json.decode(response.body)["list"][i]["offeredWorkshop"]["price"];
      // print(11);

      participantWorkshops.add(workshop);
      print(workshop);
    }
    return response;

  }


// void getSupervisorWorkshops() {
//   print(11111111111111111);
//   wsh.clear();
//   Future<http.Response> getworkshops() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String t = prefs.getString("token");
//     var response = await http.get(
//         'http://192.168.43.59:8080/api/v1/workshop/list/supervisor',
//         headers: {
//           "Accept": "application/json",
//           "content-type": "application/json",
//           "Authorization": "Bearer " + t,
//         });
//     print(1122222222);
//     print(json.decode(response.body));

//     for (int i = 0; i < json.decode(response.body).length; i++) {
//       Workshop workshop;

//       workshop.name = json.decode(response.body)[i]["name"];
//       workshop.supervisor = json.decode(response.body)[i]["supervisor"];
//       workshop.capacity = json.decode(response.body)[i]["capacity"];
//       workshop.location = json.decode(response.body)[i]["location"];
//       workshop.time = json.decode(response.body)[i]["time"];
//       workshop.id = json.decode(response.body)[i]["id"];
//       workshop.date = json.decode(response.body)[i]["date"];
//       workshop.precourse = json.decode(response.body)[i]["precourse"];
//       workshop.about = json.decode(response.body)[i]["about"];
//       workshop.price = json.decode(response.body)[i]["price"];

//       wsh.add(workshop);
//     }
//   }

//   ;
// }

Future<http.Response> getTAworkshops() async{
  // print(11111111111111111);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String tk = prefs.getString('token');
  taWorkshops.clear();
    var response = await http
        .get('http://192.168.43.59:8080/api/v1/workshop/listAsTA', headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      "Authorization": "Bearer " + tk,
    });
    print("shaytunak");
    // print(tk);
    print(json.decode(response.body));

    for (int i = 0; i < json.decode(response.body)["list"].length; i++) {
      Workshop workshop = Workshop();
      print("oskol u");
      workshop.id = json.decode(response.body)["list"][i]["offeredWorkshop"]["offeredWorkshopId"];
      // print(4);
      workshop.supervisor = json.decode(response.body)["list"][i]["supervisor"]["name"];
      // print(5);
      workshop.capacity = json.decode(response.body)["list"][i]["offeredWorkshop"]["capacity"];
      // print(6);
      workshop.location = json.decode(response.body)["list"][i]["offeredWorkshop"]["location"];
      // print(7);
      workshop.time = json.decode(response.body)["list"][i]["offeredWorkshop"]["startTime"];
      // print(8);
      workshop.name = json.decode(response.body)["list"][i]["offeredWorkshop"]["workshop"]["workshopName"];
      // print(9);
      workshop.date = json.decode(response.body)["list"][i]["offeredWorkshop"]["startDate"];
      // print(10);
      // workshop.precourse = json.decode(response.body)[i]["precourse"];
      // workshop.about = json.decode(response.body)[i]["about"];
      workshop.price = json.decode(response.body)["list"][i]["offeredWorkshop"]["price"];

      taWorkshops.add(workshop );
    }
    return response;
  }





Workshop boz = Workshop(
  about: 'e',
  name: 'sf',
  time: 'aef',
  capacity: 2,
  supervisor: "boz",
  price: 11000,
  picture: "er",
  location: "cal",
  id: 9,
  date: "40",
);
