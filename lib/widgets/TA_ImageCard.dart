import 'package:flutter/material.dart';

class TAImageCard extends StatefulWidget {
  @override
  _TAImageCardState createState() => _TAImageCardState();
}

class _TAImageCardState extends State<TAImageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: 118,
      decoration: BoxDecoration(
              color: Colors.purple[900],
              borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: <Widget>[
                    ProfileImage(),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('Bahar',
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
