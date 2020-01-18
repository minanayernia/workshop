import 'package:flutter/material.dart';
import 'package:workshop/models/workshop.dart';


// class Tile with ChangeNotifier{
//   final String title ;

//   Tile({@required this.title});
// }

// List<Tile> nfd =[Tile(title: "mina"),Tile(title: "midvna"),Tile(title: "mcvbxina"),Tile(title: "minadgsa"),Tile(title: "mizdvna")
// ,Tile(title: "mxvina"),Tile(title: "minxa")];




class Course extends StatefulWidget {
  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> {
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
                    margin: EdgeInsets.only(left: 10 , top: 10),
                    child: Text(
                      'All Courses',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height:MediaQuery.of(context).size.height * 0.85 ,
                      // child: ListView(
                      //   scrollDirection: Axis.vertical,
                      //   children: <Widget>[
                      //     CourseCard(),
                      //   ],
                      // ),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (_, i)=> CourseCard(worksh: wsh[i]),
                        itemCount: wsh.length,
                      ),
                    ),
                  )
                  
                ],
              )),
        ));
  }
}

class CourseCard extends StatefulWidget {
    final Workshop worksh;
  CourseCard({@required this.worksh});

  @override
  _CourseCardState createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
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
                    child: Text(widget.worksh.name , 
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
                child: Text('3 Sections' ,
                style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
