import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';




class User with ChangeNotifier{
  String name;
  String ncode;
  String phone;
  String token;


  Future get_user() async{
    var response = await http.post('user url',  headers: {"Authrjnj": "Bearer " + token.toString()});
    name = json.decode(response.body[0]);
  }

  Future<bool> has_token() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('token')){
      return false;
    }
    token = prefs.getString('token');
    get_user();
    ChangeNotifier();
    return true;

    // TODO

  }

}