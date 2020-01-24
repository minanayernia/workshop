import 'package:flutter/material.dart';

class Group with ChangeNotifier {
  String name;
  int participant;
  int ta;

  Group({ this.name, this.participant,this.ta});
}

