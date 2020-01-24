import 'package:flutter/material.dart';
import 'package:workshop/models/TA.dart';
import 'package:workshop/models/user.dart';

class TAImageCard extends StatefulWidget {
  User user ;
  TAImageCard({@required this.user});
  @override
  _TAImageCardState createState() => _TAImageCardState();
}

class _TAImageCardState extends State<TAImageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      // width: 118,
      margin: EdgeInsets.only(right: 10 , top: 10),
      decoration: BoxDecoration(
              color: Colors.purple[900],
              borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: <Widget>[
                    ProfileImage(),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(widget.user.name,
                      style: TextStyle(color: Colors.white, fontSize: 15.0) 
                      ) ,
                    )
                    
                ],
              ),
      
    );
  }
}


class ProfileImage extends StatefulWidget {
  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10 , top: 5, bottom: 5),
      width: 40,
      height: 60,
      decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10)),

      
    );
  }
}
