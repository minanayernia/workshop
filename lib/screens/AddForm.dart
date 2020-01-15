import 'package:flutter/material.dart';

class AddForm extends StatefulWidget {
  @override
  _AddFormState createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
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
        WhoAnswersCard(),
        QuestionCard(),
        QuestionContainer(),
        AddContainer(),
        SubmitioButton(),
      ],
    );
  }
}

class WhoAnswersCard extends StatefulWidget {
  @override
  _WhoAnswersCardState createState() => _WhoAnswersCardState();
}

class _WhoAnswersCardState extends State<WhoAnswersCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text('Ki Javab Bede',
                style: TextStyle(color: Colors.purple, fontSize: 17.0)),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: Text('Participant',
                      style: TextStyle(color: Colors.purple, fontSize: 17.0)),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: Text('T.A',
                      style: TextStyle(color: Colors.purple, fontSize: 17.0)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionCard extends StatefulWidget {
  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: TextField(
        textInputAction: TextInputAction.go,
        keyboardType: TextInputType.number,
        decoration:
            InputDecoration(border: InputBorder.none, hintText: 'Question ? '),
      ),
      height: 45,
      width: MediaQuery.of(context).size.width * 0.9,

      //width: 70,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(15),
        color: Colors.grey[200],
      ),
    );
  }
}

class QuestionContainer extends StatefulWidget {
  @override
  _QuestionContainerState createState() => _QuestionContainerState();
}

class _QuestionContainerState extends State<QuestionContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10),
            child: TextField(
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Question ? '),
            ),
            height: 45,
            width: MediaQuery.of(context).size.width * 0.85,

            //width: 70,
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(15),
              color: Colors.grey[350],
            ),
          ),
          Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 150,
                  child: RaisedButton(
                    child: Text(
                      'One',
                      style: TextStyle(
                          color: Colors.purple[600].withOpacity(0.5), fontSize: 15.0),
                    ),
                    color: Colors.grey[350],
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: 150,
                  child: RaisedButton(
                    child: Text(
                      'Two',
                      style: TextStyle(
                          color: Colors.purple[600].withOpacity(0.5), fontSize: 15.0),
                    ),
                    color: Colors.grey[350],
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
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

class AddContainer extends StatefulWidget {
  @override
  _AddContainerState createState() => _AddContainerState();
}

class _AddContainerState extends State<AddContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 180,
            height: 40,
            child: RaisedButton(
              child: Text(
                'Add Poll',
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
              color: Colors.pinkAccent,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            width: 180,
            height: 40,
            child: RaisedButton(
              child: Text(
                'Add Question',
                style: TextStyle(color: Colors.white, fontSize: 15.0),
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
    );
  }
}

class SubmitioButton extends StatefulWidget {
  @override
  _SubmitioButtonState createState() => _SubmitioButtonState();
}

class _SubmitioButtonState extends State<SubmitioButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
