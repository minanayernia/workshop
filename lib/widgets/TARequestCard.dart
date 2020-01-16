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
          color: Colors.purple[900], borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 40,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text('Bahar', 
                  style: TextStyle(color: Colors.white),),
                ),
                Container(
                  
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 20,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 20,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
        onPressed: () {},
      ),
    );
  }
}
