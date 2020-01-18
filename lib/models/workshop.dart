import 'package:flutter/material.dart';

class Workshop with ChangeNotifier{
  String name;
  int capacity ;
  String supervisor;
  String location ;
  String time ;
  String date ;

  Workshop({
    @required this.name});

}

List<Workshop> wsh =[Workshop(name: "mina") , Workshop(name: "mina") ,Workshop(name: "mina") ,Workshop(name: "mina") 
,Workshop(name: "mina"),Workshop(name: "mina"),Workshop(name: "mina") ,Workshop(name: "mincccccccccca") , ];
