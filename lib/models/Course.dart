import 'package:flutter/material.dart';

class Course with ChangeNotifier {
  String name;
  int section;

  Course({@required this.name, @required this.section});
}

List<Course> prt = [
  Course(name: "mina", section: 10, ),
];
