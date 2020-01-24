import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class User with ChangeNotifier {
  String name;
  String ncode;
  String phone;
  String token;
  int id ;

  User({
     this.name,
     this.ncode,
     this.phone,
    this.token,
    this.id ,
  });

  Future get_user() async {
    var response = await http
        .post('user url', headers: {"Authrjnj": "Bearer " + token.toString()});
    User user;
    user.name = json.decode(response.body)["name"];
    user.ncode = json.decode(response.body)["nationalCode"];
    user.phone = json.decode(response.body)["phoneNumber"];
  }

  Future<bool> has_token() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('token')) {
      return false;
    }
    token = prefs.getString('token');
    get_user();
    ChangeNotifier();
    return true;

    // TODO
  }
}

User u = User(name: "sdgs", ncode: "sfgsf", phone: "dhfdg");
User user = User() ;
