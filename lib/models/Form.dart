import 'package:flutter/material.dart';

class Form with ChangeNotifier {
  String question;

  Form({@required this.question});
}

List<Form> f = [
  Form(question: "mina"),
];
