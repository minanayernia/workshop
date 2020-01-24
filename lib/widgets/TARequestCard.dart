import 'package:flutter/material.dart';
import 'package:workshop/models/Request.dart';
import 'package:workshop/models/user.dart';

class  TARequestCard extends StatefulWidget {
  User user ;
  TARequestCard({@required this.user});
  @override
  _TARequestCardState createState() => _TARequestCardState();
}

class _TARequestCardState extends State<TARequestCard> {
  String selected = "Yes";
  String selected2 = "Yes";
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
            width: MediaQuery.of(context).size.width * 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    widget.user.name,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selected == "Yes") {
                              selected = "No";
                              selected2 = "NO";
                            } else {
                              selected = "Yes";
                              selected2 = "Yes";
                            }
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          height: 20,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: selected == "Yes"
                                    ? Colors.purple[900]
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                    color: selected == "Yes"
                                        ? Colors.white
                                        : Colors.purple[900]),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        height: 20,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: selected2 == "Yes"
                                  ? Colors.purple[900]
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              'No',
                              style: TextStyle(
                                  color: selected2 == "Yes"
                                      ? Colors.white
                                      : Colors.purple[900]),
                            ),
                          ),
                        ),
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
