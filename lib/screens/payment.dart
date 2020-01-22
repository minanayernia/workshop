import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:workshop/models/workshop.dart';
import 'package:workshop/screens/AddWorkshop.dart';
import 'package:workshop/screens/addGroup.dart';
import 'package:workshop/screens/login.dart';
import 'package:workshop/widgets/topbar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

int debt = 0;

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    final Workshop args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          children: <Widget>[
            TopBar(
              foo: "Payment",
            ),
            PaymentBox(wk: args,)
          ],
        ),
      ),
    );
  }
}

class PaymentBox extends StatefulWidget {
  Workshop wk;
  PaymentBox({this.wk});
  int number = 0;

  @override
  _PaymentBoxState createState() => _PaymentBoxState();
}

class _PaymentBoxState extends State<PaymentBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.deepPurple[700],
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Text(
            "Workshop name",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/payment.png"))),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                "Debts",
                style: TextStyle(color: Colors.white, fontSize: 15),
              )),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonTheme(
                  height: 30,
                  minWidth: 30,
                  child: RaisedButton(
                    color: Colors.pinkAccent,
                    child: Text(
                      "-",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        if (debt != -1) {
                          debt--;
                        }
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      debt.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 30,
                  minWidth: 30,
                  child: RaisedButton(
                    color: Colors.pinkAccent,
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        debt++;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.1,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Text(
                      "sat   05  oct ",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      "sat   05  oct ",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      "sat   05  oct ",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      "sat   05  oct ",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),  
          SubmmitButton(workshop: widget.wk,),
        ],
      ),
    );
  }
}

class SubmmitButton extends StatefulWidget {
  Workshop workshop;
  SubmmitButton({@required this.workshop});
  @override
  _SubmmitButtonState createState() => _SubmmitButtonState();
}

class _SubmmitButtonState extends State<SubmmitButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
      child: ButtonTheme(
          minWidth: MediaQuery.of(context).size.width * 0.8,
          height: 45,
          child: RaisedButton(
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.deepPurple[900], fontSize: 15.0),
              ),
              color: Colors.greenAccent[400],
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0),
              ),
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, '/home');
                print("fromsend");
                print(widget.workshop);
                sendUser(widget.workshop);
                // Navigator.popAndPushNamed(context, '/home');
              })),
    );
  }
}

///////////////////////////////////////////////////////////////
///send debts number
///

//////////////////////////////////////////////////////////////
///send user and workshop to enroll
///

Future<http.Response> sendUser(Workshop workshop) async {
  print("insend");
  print(workshop);
  Map data = {'id': workshop.id, 'debtDates': []};
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String tk = prefs.getString('token');

  var response = await http.post(
      'http://192.168.43.59:8080/api/v1/workshop/enroll',
      body: json.encode(data),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        "Authorization": "Bearer " + tk,
      });
  print("minakhare");
  print(json.decode(response.body));
  return response;
}
