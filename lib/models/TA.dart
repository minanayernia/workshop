import 'package:flutter/material.dart';



class TA with ChangeNotifier{

  String name ; 


  TA({

    @required this.name});

}

List<TA> t = [TA(name: "mina") ,];