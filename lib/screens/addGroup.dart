import 'package:flutter/material.dart';
import 'package:workshop/widgets/topbar.dart';

class AddGroupPage extends StatefulWidget {
  @override
  _AddGroupPageState createState() => _AddGroupPageState();
}

class _AddGroupPageState extends State<AddGroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TopBar() ,


        ],
      ),
      
    );
  }
}

class AddGroupBox extends StatefulWidget {
  @override
  _AddGroupBoxState createState() => _AddGroupBoxState();
}

class _AddGroupBoxState extends State<AddGroupBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.of(context).size.width*0.9 ,
      height: MediaQuery.of(context).size.height*0.7 ,
      decoration: BoxDecoration(color: Colors.deepPurple[600] , borderRadius: BorderRadius.circular(15)),
      
    );
  }
}