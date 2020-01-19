import 'package:flutter/material.dart';



class Request with ChangeNotifier{

  String name ; 


  Request({
    @required this.name});

}

List<Request> tr = [Request(name: "Bahar") ,];