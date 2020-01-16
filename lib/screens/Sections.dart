import 'package:flutter/material.dart';

class Sections extends StatefulWidget {
  @override
  _SectionsState createState() => _SectionsState();
}

class _SectionsState extends State<Sections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: Center(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.9,
              decoration: BoxDecoration(
                  color: Colors.deepPurple[800].withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'All Sections',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.width * 0.8,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          CourseCard(),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}


class CourseCard extends StatefulWidget {
  @override
  _CourseCardState createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width * 0.85,
        height: 72,
        decoration: BoxDecoration(
            color: Colors.deepPurple, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text('Android' , 
                    style: TextStyle(color: Colors.white , fontSize: 15.0),),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10,),
              width: 100,
              height: 25,
              decoration: BoxDecoration(
                  color: Colors.deepPurple[800].withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text('bahar' ,
                style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
