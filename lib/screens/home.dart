import 'package:flutter/material.dart';
import 'package:workshop/widgets/topbar.dart';


class Mina extends StatefulWidget {
  @override
  _MinaState createState() => _MinaState();
}

class _MinaState extends State<Mina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body:Center(
        child: Column(children: <Widget>[
          TopBar(foo: "Home",),
          HomeBody(),
          
        ],),
      ) ,
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
class HomeBody extends StatefulWidget {
  
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height-140,
      width: MediaQuery.of(context).size.width*0.9,
      child: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 100),
          ),
          // RaisedButton(
          //     child: Text('login'),
          //     onPressed: () {
          //       // Navigator.pop(context);
          //       // Navigator.pushNamed(context, '/home');
          //       Navigator.pushNamed(context, '/login');
          //     }),
          // RaisedButton(
          //     child: Text('signup'),
          //     onPressed: () {
          //       // Navigator.pop(context);
          //       // Navigator.pushNamed(context, '/home');
          //       Navigator.pushNamed(context, '/signup');
          //     }),
          // RaisedButton(
          //     child: Text('workshop'),
          //     onPressed: () {
          //       // Navigator.pop(context);
          //       // Navigator.pushNamed(context, '/home');
          //       Navigator.pushNamed(context, '/workshop');
          //     }),
          // RaisedButton(
          //     child: Text('sup'),
          //     onPressed: () {
          //       // Navigator.pop(context);
          //       // Navigator.pushNamed(context, '/home');
          //       Navigator.pushNamed(context, '/sup');
          //     }),



              // RaisedButton(
              // child: Text('ta'),
              // onPressed: () {
              //   // Navigator.pop(context);
              //   // Navigator.pushNamed(context, '/home');
              //   Navigator.pushNamed(context, '/ta');
              // }),

              //  RaisedButton(
              // child: Text('intro1'),
              // onPressed: () {
              //   // Navigator.pop(context);
              //   // Navigator.pushNamed(context, '/home');
              //   Navigator.pushNamed(context, '/intro1');
              // }),

              // RaisedButton(
              // child: Text('intro2'),
              // onPressed: () {
              //   // Navigator.pop(context);
              //   // Navigator.pushNamed(context, '/home');
              //   Navigator.pushNamed(context, '/intro2');
              // }),

              // RaisedButton(
              // child: Text('add form'),
              // onPressed: () {
              //   // Navigator.pop(context);
              //   // Navigator.pushNamed(context, '/home');
              //   Navigator.pushNamed(context, '/add form');
              // }),



              // RaisedButton(
              // child: Text('add workshop'),
              // onPressed: () {
              //   // Navigator.pop(context);
              //   // Navigator.pushNamed(context, '/home');
              //   Navigator.pushNamed(context, '/add workshop');
              // }),


              // RaisedButton(
              // child: Text('workshopAccountor'),
              // onPressed: () {
              //   // Navigator.pop(context);
              //   // Navigator.pushNamed(context, '/home');
              //   Navigator.pushNamed(context, '/workshopAccountor');
              // }),



              // RaisedButton(
              // child: Text('course'),
              // onPressed: () {
              //   // Navigator.pop(context);
              //   // Navigator.pushNamed(context, '/home');
              //   Navigator.pushNamed(context, '/course');
              // }),
              // RaisedButton(
              //   child: Text('form'),
              // onPressed: () {
              //   // Navigator.pop(context);
              //   // Navigator.pushNamed(context, '/home');
              //   Navigator.pushNamed(context, '/form');
              
              
              // }),

              // RaisedButton(
              // child: Text('payment'),
              // onPressed: () {
              //   // Navigator.pop(context);
              //   // Navigator.pushNamed(context, '/home');
              //   Navigator.pushNamed(context, '/payment');
              // }),

              // RaisedButton(
              // child: Text('addgroup'),
              // onPressed: () {
              //   // Navigator.pop(context);
              //   // Navigator.pushNamed(context, '/home');
              //   Navigator.pushNamed(context, '/addGroup');
              // }),

              // RaisedButton(
              // child: Text('instalment'),
              // onPressed: () {
              //   // Navigator.pop(context);
              //   // Navigator.pushNamed(context, '/home');
              //   Navigator.pushNamed(context, '/instalment');
              // }),


        ],
      )),
      
    );
  }
}
