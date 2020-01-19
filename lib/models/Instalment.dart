import 'package:flutter/material.dart';



class Instalment with ChangeNotifier{

  String date ; 
  int money ;


  Instalment({
    @required this.date , 
    @required this.money});

}

List<Instalment> r = [Instalment(date: "mina" , money: 75) ,];