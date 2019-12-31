import 'package:flutter/material.dart';
import 'package:workshop/main.dart';
import 'package:workshop/widgets/background.dart';
import 'package:workshop/screens/workshop-details.dart';

class Workshopdetails extends StatefulWidget {
  @override
  _WorkshopdetailsState createState() => _WorkshopdetailsState();
}

class _WorkshopdetailsState extends State<Workshopdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(),
          Page(),
        ],
      ),
    );
  }
}

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Workshopimage(),
        Detailcard(),
        TimePlcecard(),
        Enrollbutton(),
        TAcard(),
      ],
    );
  }
}

class Workshopimage extends StatefulWidget {
  @override
  _WorkshopimageState createState() => _WorkshopimageState();
}

class _WorkshopimageState extends State<Workshopimage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(10)),
          width: 100,
          height: 100,
        )
      ],
    );
  }
}

class Detailcard extends StatefulWidget {
  @override
  _DetailcardState createState() => _DetailcardState();
}

class _DetailcardState extends State<Detailcard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 15),
          child: Column(children: <Widget>[
            Row(children: <Widget>[
              Text('Android' ,
              style: TextStyle(color: Colors.purple , fontSize: 30.0), )
            ],) , 
            Row(children: <Widget>[
              Text('Dr hamze' , 
              style: TextStyle(color: Colors.purple[300] , fontSize: 20.0),)
            ],) , 
            Row(children: <Widget>[
              Text('Prerequisite' , 
              style: TextStyle(color: Colors.purple[200] , fontSize: 15.0),)
            ],) , 
            Row(children: <Widget>[
              Text('hihihihihih' , 
              style: TextStyle(color: Colors.black , fontSize: 20.0),)
            ],) , 
          ],),
        )
      ],
    );
  }
}

class TimePlcecard extends StatefulWidget {
  @override
  _TimePlcecardState createState() => _TimePlcecardState();
}

class _TimePlcecardState extends State<TimePlcecard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.deepPurple[700].withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.only(top: 15,),
          child: Container(
            margin: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                  Icon(Icons.calendar_today , color: Colors.white,), Text('Sat,05 Oct',
                  style: TextStyle(color: Colors.white , fontSize: 20.0), )],
                ),
                Row(
                  children: <Widget>[Icon(Icons.time_to_leave , color: Colors.white,), Text('bahar',
                  style: TextStyle(color: Colors.white , fontSize: 20.0),
                  )],
                ),
                Row(
                  children: <Widget>[Icon(Icons.place , color: Colors.white,), Text('bahar',
                  style: TextStyle(color: Colors.white , fontSize: 20.0),)],
                ),
                Row(
                  children: <Widget>[Icon(Icons.person , color: Colors.white,), Text('bahar',
                  style: TextStyle(color: Colors.white , fontSize: 20.0),),
                 // Price(),
                  ],
                )
                
              ],
            ),
          ),
          
        ),
         
      ],
    );
  }
}

class Enrollbutton extends StatefulWidget {
  @override
  _EnrollbuttonState createState() => _EnrollbuttonState();
}

class _EnrollbuttonState extends State<Enrollbutton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      child: RaisedButton(
        child: Text(
          'Enroll',
          style: TextStyle(color: Colors.deepPurple[900], fontSize: 17.0),
        ),
        color: Colors.greenAccent[400],
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0),
        ),
        onPressed: () {
          // Navigator.pop(context);
          // Navigator.pushNamed(context, '/home');
          // Navigator.popAndPushNamed(context, '/login');
        },
      ),
    );
  }
}

class TAcard extends StatefulWidget {
  @override
  _TAcardState createState() => _TAcardState();
}

class _TAcardState extends State<TAcard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.deepPurple[700].withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10 , left: 10),
                child: Row(
                
                children: <Widget>[
                Text('TAs' , 
                style: TextStyle(color: Colors.white , fontSize: 20.0),),
              ],),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Requestbutton(),
              ],) ,
              
            ],
          ),
        )
      ],
    );
  }
}
class Requestbutton extends StatefulWidget {
  @override
  _RequestbuttonState createState() => _RequestbuttonState();
}

class _RequestbuttonState extends State<Requestbutton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: MediaQuery.of(context).size.width * 0.8,
        height: 37,
        child: RaisedButton(
            child: Text(
              'Request',
              style: TextStyle(color: Colors.deepPurple[900], fontSize: 15.0),
            ),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(35.0),
            ),
            onPressed: () {
              // Navigator.pop(context);
              // Navigator.pushNamed(context, '/home');
              Navigator.popAndPushNamed(context, '/login');
            }));
  }
}


class Price extends StatefulWidget {
  @override
  _PriceState createState() => _PriceState();
}

class _PriceState extends State<Price> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      child: Center(child: Text('150',
      style: TextStyle(color: Colors.deepPurple[900], fontSize: 35.0), ),
      ),
      decoration: BoxDecoration(shape: BoxShape.rectangle, borderRadius: new BorderRadius.circular(25),color: Colors.white,),
      
    );
  }
}
