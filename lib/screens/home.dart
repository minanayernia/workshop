import 'package:flutter/material.dart';

class Mina extends StatefulWidget {
  @override
  _MinaState createState() => _MinaState();
}

class _MinaState extends State<Mina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Center(child:Column(children: <Widget>[
              RaisedButton(
              child: Text('login'),
              onPressed: 
                (){
                  // Navigator.pop(context);
                  // Navigator.pushNamed(context, '/home');
                  Navigator.popAndPushNamed(context, '/login');
                }
              ),

              RaisedButton(
              child: Text('signup'),
              onPressed: 
                (){
                  // Navigator.pop(context);
                  // Navigator.pushNamed(context, '/home');
                  Navigator.popAndPushNamed(context, '/signup');
                }
              ),
      ],)
        
              
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
    return Container(
      
    );
  }
}