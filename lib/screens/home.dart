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
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 100),
          ),
          RaisedButton(
              child: Text('login'),
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, '/home');
                Navigator.pushNamed(context, '/login');
              }),
          RaisedButton(
              child: Text('signup'),
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, '/home');
                Navigator.pushNamed(context, '/signup');
              }),
          RaisedButton(
              child: Text('workshop'),
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, '/home');
                Navigator.pushNamed(context, '/workshop');
              }),
          RaisedButton(
              child: Text('sup'),
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, '/home');
                Navigator.pushNamed(context, '/sup');
              }),
        ],
      )),
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
    return Container();
  }
}
