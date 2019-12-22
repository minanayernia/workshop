import 'package:flutter/material.dart';


class ProCard extends StatefulWidget {
  @override
  _ProCardState createState() => _ProCardState();
}

class _ProCardState extends State<ProCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
          child: Stack(
        overflow: Overflow.clip,
        // fit: StackFit.loose,
        children: <Widget>[
          BackCircle(),
          PersonCard(),
          BackInsideCircle(),
        ],
      
      ),
    );
  }
}


class PersonCard extends StatefulWidget {
  @override
  _PersonCardState createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[ Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        // color: Colors.red,
        height: 140,
        width: 260,
        margin: EdgeInsets.only(top:30 ),
      // color: Colors.blue,
       alignment: Alignment.center,
      child: Container(
      width: 260,height: 140,
      alignment: FractionalOffset.center,
      child: Text('r'),
      decoration: BoxDecoration(color: Colors.green, shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(10)
       , ),
        ),
        ),]
    );
      
  }
}

class BackCircle extends StatefulWidget {
  @override
  _BackCircleState createState() => _BackCircleState();
}

class _BackCircleState extends State<BackCircle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
        alignment: Alignment.center,
        // color: Colors.red,
        height: 200,
        margin: EdgeInsets.only(top: 0, ),
        child: CircleAvatar( radius: 100, backgroundColor: Colors.yellow ),
      );
  }
}


class BackInsideCircle extends StatefulWidget {
  @override
  _BackInsideCircleState createState() => _BackInsideCircleState();
}

class _BackInsideCircleState extends State<BackInsideCircle> {
  @override
  Widget build(BuildContext context) {
    return Row(
  
      mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [ Container(
            margin: EdgeInsets.only(top: 90),
            alignment: FractionalOffset.bottomRight,
        // color: Colors.red,
        height: 110,
        width: 330,
        
        child: CircleAvatar(radius: 55, backgroundColor: Colors.purple,),
      ),]
    );
  }
}