import 'package:flutter/material.dart';

class Group with ChangeNotifier {
  String name;
  int participant;
  int ta;

  Group({@required this.name, @required this.participant, @required this.ta});
}

List<Group> prt = [
  Group(name: "mina", participant: 10, ta: 1),
];
