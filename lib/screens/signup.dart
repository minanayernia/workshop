import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workshop/widgets/background.dart';
import 'package:workshop/screens/login.dart';
import 'package:http/http.dart' as http;

final fullname = TextEditingController();
// final nationalcode = TextEditingController();
final mobilenumber = TextEditingController();
int gender = 1; //0 => male    1 => female

bool pressAttention = false;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      body: SingleChildScrollView(
        child: new GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/learnoo-pattern.png'),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              LoginButton(),
              Center(child: SignupCard(),)
            ],),
          ),
        ),
      ),
    );
  }
}

class SignupCard extends StatefulWidget {
  @override
  _SignupCardState createState() => _SignupCardState();
}

class _SignupCardState extends State<SignupCard> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 400,
          margin: EdgeInsets.only(bottom: 60),
          decoration: BoxDecoration(
              color: Colors.deepPurple[700].withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
              ),
              ProPic(),
              FullName(),
              Nationalcard(bozak: nationalCodesgn),
              MobileNumber(),
              Gender(),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              Signupbutton(),
            ],
          ),
        )
      ])
    ]);
  }
}

class FullName extends StatefulWidget {
  @override
  _FullNameState createState() => _FullNameState();
}

class _FullNameState extends State<FullName> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: TextField(
        controller: fullname,
        textInputAction: TextInputAction.go,
        decoration: InputDecoration(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            border: InputBorder.none,
            hintText: 'Full Name'),
      ),
      height: 45,
      width: MediaQuery.of(context).size.width * 0.85,

      //width: 70,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(15),
        color: Colors.white,
      ),
    );
  }
}

class MobileNumber extends StatefulWidget {
  @override
  _MobileNumberState createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: TextField(
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
        controller: mobilenumber,
        decoration: InputDecoration(
            icon: Icon(
              Icons.phone_iphone,
              color: Colors.black,
            ),
            border: InputBorder.none,
            hintText: 'Mobile Number'),
      ),
      height: 45,
      width: MediaQuery.of(context).size.width * 0.85,

      //width: 70,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(15),
        color: Colors.white,
      ),
    );
  }
}

class Gender extends StatefulWidget {
  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GenderBox(),
      height: 40,
      width: MediaQuery.of(context).size.width * 0.85,

      //width: 70,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(15),
        color: Colors.grey,
      ),
    );
  }
}

class MaleButton extends StatefulWidget {
  @override
  _MaleButtonState createState() => _MaleButtonState();
}

class _MaleButtonState extends State<MaleButton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: MediaQuery.of(context).size.width * 0.425,
        height: 45,
        child: RaisedButton(
            child: Text(
              'Male',
              style: TextStyle(color: Colors.deepPurple[900], fontSize: 15.0),
            ),
            // color: Colors.grey,

            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15.0),
            ),
            color: pressAttention ? Colors.grey : Colors.white,
            onPressed: () => setState(() => pressAttention = !pressAttention)));
  }
}

class FemaleButton extends StatefulWidget {
  @override
  _FemaleButtonState createState() => _FemaleButtonState();
}

class _FemaleButtonState extends State<FemaleButton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: MediaQuery.of(context).size.width * 0.425,
        height: 45,
        child: RaisedButton(
            child: Text(
              'Female',
              style: TextStyle(color: Colors.deepPurple[900], fontSize: 15.0),
            ),
            // color: Colors.grey,

            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15.0),
            ),
            color: pressAttention ? Colors.grey : Colors.white,
            onPressed: () {
              setState(() => pressAttention = !pressAttention);
            }));
  }
}

class ProPic extends StatefulWidget {
  @override
  _ProPicState createState() => _ProPicState();
}

class _ProPicState extends State<ProPic> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 70,
      child: Icon(Icons.person),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(10),
        color: Colors.white,
      ),
    );
  }
}

class Signupbutton extends StatefulWidget {
  @override
  _SignupbuttonState createState() => _SignupbuttonState();
}

class _SignupbuttonState extends State<Signupbutton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: MediaQuery.of(context).size.width * 0.85,
        height: 45,
        child: RaisedButton(
            child: Text(
              'Sign Up',
              style: TextStyle(color: Colors.deepPurple[900], fontSize: 15.0),
            ),
              color: Colors.greenAccent[400],
              
              shape: RoundedRectangleBorder( borderRadius: new BorderRadius.circular(25.0),
           ),

          

              onPressed: 
              
                (){ 
                  Map data = {'name':fullname.text , 'nationalCode' :nationalCodesgn.text ,'phoneNumber' :mobilenumber.text , 'gender' : gender };
             Future<http.Response> sendPersonDetail() async{
               var response = 
                await http.post('http://192.168.43.59:8080/api/v1/signup',
                headers: {"Accept": "application/json", "content-type": "application/json"} 
                );

                SharedPreferences prefs = await SharedPreferences.getInstance();
                print(response.body);
                if (json.decode(response.body)["jwt"] != ""){
                  String b = json.decode(response.body)["jwt"];
                prefs.setString("token", b);
                Navigator.pushNamed(context, '/home');
                } else{
                  print("boz");
                  Navigator.pushNamed(context, '/login');
                }
                
                // String b = (json.decode(response.body[0]));
                // prefs.setString("token", b);
        
             }
             sendPersonDetail();
                  // Navigator.pop(context);
                  // Navigator.pushNamed(context, '/home');
                  Navigator.pushNamed(context, '/home');
                }
              
      
    )
    );
  }
}

class GenderBox extends StatefulWidget {
  @override
  _GenderBoxState createState() => _GenderBoxState();
}

class _GenderBoxState extends State<GenderBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * 0.425,
              height: 45,
              child: RaisedButton(
                  elevation: 0,
                  child: Text(
                    'Male',
                    style: TextStyle(
                        color: Colors.deepPurple[900], fontSize: 15.0),
                  ),
                  // color: Colors.grey,

                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                  color: !pressAttention ? Colors.grey : Colors.white,
                  onPressed: () {
                    setState(() => pressAttention = !pressAttention);
                    gender = 0;
                    print(gender);
                  })),
          ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * 0.425,
              height: 45,
              child: RaisedButton(
                  elevation: 0,
                  child: Text(
                    'Female',
                    style: TextStyle(
                        color: Colors.deepPurple[900], fontSize: 15.0),
                  ),
                  // color: Colors.grey,

                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                  color: pressAttention ? Colors.grey : Colors.white,
                  onPressed: () {
                    setState(() => pressAttention = !pressAttention);
                    gender = 1;
                    print(gender);
                  }))
        ],
      ),
    );
  }
}

class LoginButton extends StatefulWidget {
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      margin: EdgeInsets.only(top: 10),
      height: 40,
      width: MediaQuery.of(context).size.width * 0.9,
      child: RaisedButton(
        child: Text(
          'Log In',
          style: TextStyle(color: Colors.deepPurple[600], fontSize: 17.0),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
      ),
    );
  }
}
