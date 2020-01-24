import 'package:flutter/material.dart';
import 'package:workshop/widgets/topbar.dart';
import 'package:workshop/models/Questionmaker.dart';

// List<String> Dq = [];
List<MakeQuestion> questions = [];

TextEditingController quest = TextEditingController();

class AddForm extends StatefulWidget {
  @override
  _AddFormState createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Center(
            child: Column(
              children: <Widget>[
                TopBar(
                  foo: "Add form",
                ),
                Page(),
              ],
            ),
          ),
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
        Container(
          height: 300,
          width: MediaQuery.of(context).size.width * 0.9,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (_, i) => QuestionCard(
              question: questions[i],
            ),
            itemCount: questions.length,
          ),
        ),
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
  bool selected = false;
  bool selected2 = false;
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                      if (selected2 == true) {
                        selected2 = !selected2;
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(5)),
                    width: 20,
                    height: 20,
                    child: Container(
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: selected == true
                              ? Colors.pinkAccent
                              : Colors.white,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                  ),
                )
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected2 = !selected2;
                      if (selected == true) {
                        selected = !selected;
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(5)),
                    width: 20,
                    height: 20,
                    child: Container(
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: selected2 == true
                              ? Colors.pinkAccent
                              : Colors.white,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionCard extends StatefulWidget {
  MakeQuestion question;
  QuestionCard({this.question});
  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: TextField(
        cursorColor: Colors.purple,
        textInputAction: TextInputAction.go,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Question ? ',
            hintStyle: TextStyle(color: Colors.purple.withOpacity(0.5))),
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
              controller: quest,
              cursorColor: Colors.purple,
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Question ? ',
                  hintStyle: TextStyle(color: Colors.purple.withOpacity(0.5))),
            ),
            height: 45,
            width: MediaQuery.of(context).size.width * 0.85,

            //width: 70,
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(15),
              color: Colors.grey[300],
            ),
          ),
          Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Container(
                      width: 150,
                      height: 40,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        alignment: Alignment.center,
                        child: TextField(
                          cursorColor: Colors.purple,
                          textInputAction: TextInputAction.go,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'One',
                              hintStyle: TextStyle(
                                  color: Colors.purple.withOpacity(0.5))),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: TextField(
                      cursorColor: Colors.purple,
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Two',
                          hintStyle:
                              TextStyle(color: Colors.purple.withOpacity(0.5))),
                    ),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Container(
          //   width: MediaQuery.of(context).size.width * 0.43,
          //   height: 40,
          //   child: RaisedButton(
          //     child: Text(
          //       'Add Poll',
          //       style: TextStyle(color: Colors.white, fontSize: 15.0),
          //     ),
          //     color: Colors.pinkAccent,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: new BorderRadius.circular(20.0),
          //     ),
          //     onPressed: () {
          //
          //     },
          //   ),
          // ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
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
              onPressed: () {
                setState(() {
                  MakeQuestion q = MakeQuestion();
                  print("hi");
                  q.ques = "hi";
                  questions.add(q);
                  print(questions[0].ques);
                });
              },
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
