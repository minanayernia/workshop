import 'package:flutter/material.dart';
// import 'package:workshop/screens/form.dart';
import 'package:workshop/widgets/topbar.dart';


int groupTAs ;
int groupParticipants ;
int selectedTAs = 0;
int selectedParticipants = 0;



class AddGroupPage extends StatefulWidget {
  @override
  _AddGroupPageState createState() => _AddGroupPageState();
}

class _AddGroupPageState extends State<AddGroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
            child: Column(
            children: <Widget>[
        TopBar(foo: "Add Group",) ,
        AddGroupBox() ,
        SubmittButton(),


            ],
          ),
      ),
      
    );
  }
}

class AddGroupBox extends StatefulWidget {
  @override
  _AddGroupBoxState createState() => _AddGroupBoxState();
}

class _AddGroupBoxState extends State<AddGroupBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width:MediaQuery.of(context).size.width*0.9 ,
      height: MediaQuery.of(context).size.height*0.8 ,
      decoration: BoxDecoration(color: Colors.deepPurple[700], borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 7),),
          Text("Group#1" , style: TextStyle(color: Colors.white , fontSize: 15),) ,
          Padding(padding: EdgeInsets.only(top: 10),) ,
          Container(
            // color: Colors.red,
            height:20 ,
            child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    height: 20,
                    child: Text("TAs" , style: TextStyle(color: Colors.white),),
                  ),
                  
                  Container(
                    width: 50,
                    height: 20,
                    child: Center(child: Text(groupTAs.toString())),
                    decoration: BoxDecoration(color: Colors.deepPurple , borderRadius: BorderRadius.circular(25)),
                  ),
                  Padding(padding: EdgeInsets.only(left: 4),) ,
                  Container(
                    width: 50,
                    height: 20,
                    decoration: BoxDecoration(color: Colors.deepPurple , borderRadius: BorderRadius.circular(25)),
                    child: Center(child: Text(selectedTAs.toString())),
                  )
                ],

              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 7),),
          Container(
            width: MediaQuery.of(context).size.width*0.75,
            height: 90,
            // decoration: BoxDecoration(color: Colors.red),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                TACard(),
                TACard(),
                TACard(),
                TACard(),
                TACard(),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10),),
          Container(
            // color: Colors.red,
            height:20 ,
            child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    height: 20,
                    child: Text("Participants" , style: TextStyle(color: Colors.white),),
                  ),
                  
                  Container(
                    width: 50,
                    height: 20,
                    child: Center(child: Text(groupParticipants.toString())),
                    decoration: BoxDecoration(color: Colors.deepPurple , borderRadius: BorderRadius.circular(25)),
                  ),
                  Padding(padding: EdgeInsets.only(left: 4),) ,
                  Container(
                    width: 50,
                    height: 20,
                    decoration: BoxDecoration(color: Colors.deepPurple , borderRadius: BorderRadius.circular(25)),
                    child: Center(child: Text(selectedParticipants.toString())),
                  )
                ],

              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 8),),
          Container(
            height:MediaQuery.of(context).size.height*0.5 ,
            width: MediaQuery.of(context).size.width*0.8 ,
            child:ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                ParticipantCard(),
                ParticipantCard(),
                ParticipantCard(),
                ParticipantCard(),
                ParticipantCard(),
                ParticipantCard(),
              ],
            ) ,)
        ],
      ),
      
    );
  }
}

class TACard extends StatefulWidget {
  
  @override
  _TACardState createState() => _TACardState();
}

class _TACardState extends State<TACard> {
  bool selected = false ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
         onTap: () {
            setState(() {
              selected = !selected;
              if (selected == true){
                selectedTAs++ ;
                print(selectedTAs);
              }if (selected == false){
                if(selectedTAs != -1){
                  selectedTAs-- ;
                }
              }
            });
          },
        child: Container(
        height: 70 ,
        width: 150,
        decoration: BoxDecoration(color: selected == true ? Colors.greenAccent[400] : Colors.deepPurple[800] , borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.only(right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 70,
              width: 60,
              decoration: BoxDecoration(color: Colors.grey , borderRadius: BorderRadius.circular(15)),
            ),
            Padding(padding: EdgeInsets.only(left: 6),),
            Text("TA name")
          ],
        ),
      ),
    );
      
  }
}
class SubmittButton extends StatefulWidget {
  @override
  _SubmittButtonState createState() => _SubmittButtonState();
}

class _SubmittButtonState extends State<SubmittButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 7),
        child: ButtonTheme(
        minWidth: MediaQuery.of(context).size.width * 0.9,
        height: 45,
        child:RaisedButton(
                child: Text('Add Group',
                style: TextStyle(color: Colors.deepPurple[900] , fontSize: 15.0),
              ),
                color: Colors.greenAccent[400],
                
                shape: RoundedRectangleBorder( borderRadius: new BorderRadius.circular(25.0),
             ),
                onPressed: 
                
                  (){
                    // Navigator.pop(context);
                    // Navigator.pushNamed(context, '/home');
                    Navigator.popAndPushNamed(context, '/login');
                  }
                
        
      )
      ),
    );
  }
}

class ParticipantCard extends StatefulWidget {
  @override
  _ParticipantCardState createState() => _ParticipantCardState();
}

class _ParticipantCardState extends State<ParticipantCard> {
  String selected = "+" ;
  // bool select = false ;
  @override
  Widget build(BuildContext context) {
    return Container(
    height: 80,
    width: MediaQuery.of(context).size.width*0.7,
    margin: EdgeInsets.only(top: 8),
    decoration: BoxDecoration(color: selected == "+" ? Colors.white : Colors.greenAccent[400], borderRadius: BorderRadius.circular(15)),
    child: Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 7),),
        Container(
          height: 70,
          width: 60,
          decoration: BoxDecoration(color: Colors.grey , borderRadius: BorderRadius.circular(15)),
        ),
        Padding(padding: EdgeInsets.only(left: 7),),
        Container(
          // height: ,
          width: MediaQuery.of(context).size.width*0.45,
          child: Text("Participant name"),
        ),
        GestureDetector(
          onTap: () {
          setState(() {
            if(selected == "+"){
              selected = "-" ;
            }else{
              selected = "+" ;
            }
            
          });
        },
            child: Container(
            height: 70,
            width: 40,
            decoration: BoxDecoration(color: selected == '+' ? Colors.pinkAccent : Colors.white, borderRadius: BorderRadius.circular(29)),
            child: Center(child: Text(selected , style: TextStyle(color:  selected == '+' ? Colors.white: Colors.pinkAccent, fontSize: 30),)),
          ),
        )
      ],
    ),
      );
  }
}