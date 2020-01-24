import 'package:flutter/material.dart';

class NotifCard extends StatefulWidget {
  @override
  _NotifCardState createState() => _NotifCardState();
}

class _NotifCardState extends State<NotifCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/form') ;
      },
          child: Container(
        height: 72,
        width:MediaQuery.of(context).size.width*0.8 ,
        margin: EdgeInsets.only(top: 10 , left: 10 , right: 10),
        decoration: BoxDecoration(
            color: Colors.deepPurple[700],
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: <Widget>[
            ProfileImage(),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20 , top: 10),
                    child: Text('Notification',
                        style: TextStyle(color: Colors.white, fontSize: 15.0)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15 , top: 5),
                    child: Text('Recieved Form',
                        style: TextStyle(color: Colors.white, fontSize: 15.0)),
                  ),
                ],
              ),
            )
          ],
        ),
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
      margin: EdgeInsets.only(left: 10, top: 5, bottom: 5),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
