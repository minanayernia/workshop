import 'package:flutter/material.dart';
import 'package:workshop/widgets/mmd.dart';
import 'package:workshop/widgets/topbar.dart';

class Jobs extends StatefulWidget {
  @override
  _JobsState createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          TopBar(
            foo: "Home",
          ),
          //  Padding(padding: EdgeInsets.only(top: 50),),
          Container(
            height: MediaQuery.of(context).size.height*0.9,
            width: MediaQuery.of(context).size.width*1.2,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                MmdCard(),
                MmdCard(),
                MmdCard(),
                MmdCard(),
                MmdCard(),
                MmdCard(),
                MmdCard(),
                MmdCard(),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
