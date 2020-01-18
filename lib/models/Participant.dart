import 'package:flutter/material.dart';



class Participant with ChangeNotifier{

  String name ; 


  Participant({
    @required this.name});

}

List<Participant> prt = [Participant(name: "mina") ,];