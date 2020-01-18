import 'package:flutter/material.dart';



class Instalment with ChangeNotifier{

  String date ; 
  int money ;


  Instalment({
    @required this.date , 
    @required this.money});

}

List<Instalment> prt = [Instalment(date: "mina" , money: 75) ,];