import 'package:flutter/material.dart';
import 'package:workshop/screens/AddForm.dart';

class AddWorkshop extends StatefulWidget {
  @override
  _AddWorkshopState createState() => _AddWorkshopState();
}

class _AddWorkshopState extends State<AddWorkshop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Form'),
        leading: Icon(Icons.ac_unit),
        actions: <Widget>[Icon(Icons.wb_sunny)],
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: Center(
        child: Column(
          children: <Widget>[
            Page(),
          ],
        ),
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
        WorkshopInfo(),
        WorkshopDtailCard(),
        SchedualCard(),
        SubmitButton(),
      ],
    );
  }
}

class WorkshopInfo extends StatefulWidget {
  @override
  _WorkshopInfoState createState() => _WorkshopInfoState();
}

class _WorkshopInfoState extends State<WorkshopInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 28,
                  margin: EdgeInsets.only(left: 10, top: 5),
                  child: TextField(
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Workshop Name'),
                  ),
                  width: MediaQuery.of(context).size.width * 0.65,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 28,
                  width: MediaQuery.of(context).size.width * 0.67,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WorkshopDtailCard extends StatefulWidget {
  @override
  _WorkshopDtailCardState createState() => _WorkshopDtailCardState();
}

class _WorkshopDtailCardState extends State<WorkshopDtailCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              'Details',
              style: TextStyle(color: Colors.purple[700], fontSize: 17.0),
            ),
          ),
          Container(
            
            margin: EdgeInsets.only(left: 10),
            child: Text(
              'Prerquisite',
              style: TextStyle(color: Colors.purple[800], fontSize: 12.0),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 130,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Question ? '),
            ),
          ),
        ],
      ),
    );
  }
}

class SchedualCard extends StatefulWidget {
  @override
  _SchedualCardState createState() => _SchedualCardState();
}

class _SchedualCardState extends State<SchedualCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 235,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.purple,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 60,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text('25/01'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 60,
                    height: 35,
                    child: RaisedButton(
                      child: Text(
                        '+',
                        style: TextStyle(color: Colors.white, fontSize: 30.0),
                      ),
                      color: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              )),
          Container(
            padding: EdgeInsets.only(left: 10, top: 5),
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.timelapse,
                    color: Colors.purple,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, top: 5),
                  width: 60,
                  height: 35,
                  child: RaisedButton(
                    child: Text(
                      '+',
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    ),
                    color: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, top: 5),
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.location_on,
                    color: Colors.purple,
                  ),
                ),
                Container(
                  height: 35,
                  margin: EdgeInsets.only(left: 10, top: 5),
                  child: TextField(
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Location'),
                  ),
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.circular(15),
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, top: 5),
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.people,
                    color: Colors.purple,
                  ),
                ),
                Container(
                  height: 35,
                  margin: EdgeInsets.only(left: 10, top: 5),
                  child: TextField(
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Capacity'),
                  ),
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.circular(15),
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, top: 5),
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.monetization_on,
                    color: Colors.purple,
                  ),
                ),
                Container(
                  height: 35,
                  margin: EdgeInsets.only(left: 10, top: 5),
                  child: TextField(
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'price'),
                  ),
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.circular(15),
                    color: Colors.grey[300],
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

class SubmitButton extends StatefulWidget {
  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width * 0.9,
      child: RaisedButton(
        child: Text(
          'Submit',
          style: TextStyle(color: Colors.deepPurple[900], fontSize: 15.0),
        ),
        color: Colors.greenAccent[400],
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0),
        ),
        onPressed: () {},
      ),
    );
  }
}