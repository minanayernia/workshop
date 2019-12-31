import 'package:flutter/material.dart';


class TARequestCard extends StatefulWidget {
  @override
  _TARequestCardState createState() => _TARequestCardState();
}

class _TARequestCardState extends State<TARequestCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 236,
      height: 72,
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.deepPurple[800].withOpacity(0.8),
          borderRadius: BorderRadius.circular(10)),

      
    );
  }
}



class AcceptButton extends StatefulWidget {
  @override
  _AcceptButtonState createState() => _AcceptButtonState();
}

class _AcceptButtonState extends State<AcceptButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: RaisedButton(
          
        ),
    );
  }
}