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



              RaisedButton(
              child: Text('ta'),
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, '/home');
                Navigator.pushNamed(context, '/ta');
              }),

               RaisedButton(
              child: Text('intro1'),
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, '/home');
                Navigator.pushNamed(context, '/intro1');
              }),

              RaisedButton(
              child: Text('intro2'),
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, '/home');
                Navigator.pushNamed(context, '/intro2');
              }),

              RaisedButton(
              child: Text('add form'),
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, '/home');
                Navigator.pushNamed(context, '/add form');
              }),



              RaisedButton(
              child: Text('add workshop'),
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, '/home');
                Navigator.pushNamed(context, '/add workshop');
              }),


              RaisedButton(
              child: Text('workshopAccountor'),
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, '/home');
                Navigator.pushNamed(context, '/workshopAccountor');
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
