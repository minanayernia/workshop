import 'package:flutter/material.dart';



class PreCourse with ChangeNotifier{

  String name ; 


  PreCourse({
    @required this.name});

}

List<PreCourse> prt = [PreCourse(name: "mina") ,];