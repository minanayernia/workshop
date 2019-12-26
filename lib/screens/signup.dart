import 'package:flutter/material.dart';
import 'package:workshop/widgets/background.dart';
import 'package:workshop/screens/login.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(),
          SignupCard(),
        ],
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
    
      children: <Widget>[
        Column(
       mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 400,
      margin: EdgeInsets.only(bottom: 60),
      decoration: BoxDecoration(color: Colors.deepPurple[700].withOpacity(0.5) ,borderRadius: BorderRadius.circular(10)),
      child: Column(children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 10 , left: 10),),
        ProPic(),
        FullName(),
        Nationalcard(),
        
      ],
      ),
    )])]);

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
      child: Row(children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 10)),
        Icon(Icons.person ),
        Padding(padding: EdgeInsets.only(left: 10),),
        Text('Full Name')
      ],),
      height: 45,
      width: MediaQuery.of(context).size.width * 0.85,
      
      //width: 70,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(shape: BoxShape.rectangle, borderRadius: new BorderRadius.circular(15),color: Colors.white,),

      
    );
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
      height: 50,
      child: Icon(Icons.person),
      color: Colors.white,
      decoration: BoxDecoration(shape: BoxShape.rectangle , borderRadius:new BorderRadius.circular(radius) ), 
      
    );
  }
}