import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:workshop/main.dart';
import 'package:workshop/widgets/background.dart';
import 'package:workshop/widgets/workshop_card.dart';

final nationalCode = TextEditingController() ;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      body: SingleChildScrollView(
        //       child: Stack(children: <Widget>[
        //   Background(),
        //   Foregrand()
          
        // ],),

        child: new GestureDetector(
                  onTap: (){
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                child: Container(
                    height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/learnoo-pattern.png'),
          fit: BoxFit.cover
          )
          ),
                    child: Center(child:Foregrand()),
        ),
                )

      ),
      
    );
  }
}


class Foregrand extends StatefulWidget {
  @override
  _ForegrandState createState() => _ForegrandState();
}

class _ForegrandState extends State<Foregrand> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Topimage(),
        LoginCard()
        ],
      
    );
  }
}

class LoginCard extends StatefulWidget {
  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 100),
        // color: Colors.green,
          child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
         mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 140,
        // color: Colors.yellow,
        // alignment: Alignment.center,
        margin: EdgeInsets.only(
      top: 60
        ),
        decoration: BoxDecoration(color: Colors.deepPurple[700].withOpacity(0.5) ,borderRadius: BorderRadius.circular(10)),
        child: Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.center,),
      Nationalcard(),
      Padding(padding: EdgeInsets.only(top: 15),),
      SubmitButtom()
        ],),
      ),
        ],
      ),
    );

  }
}

class LoginImage extends StatefulWidget {
  @override
  _LoginImageState createState() => _LoginImageState();
}

class _LoginImageState extends State<LoginImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/learnoo-pattern.png'),
        fit: BoxFit.cover)
      ),
      
      
      
    );
  }
}

class Topimage extends StatefulWidget {
  @override
  _TopimageState createState() => _TopimageState();
}

class _TopimageState extends State<Topimage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Image.asset('assets/login-img.png'),
    // color: Colors.red,
    );
  }
}



class SubmitButtom extends StatefulWidget {
  @override
  _SubmitButtomState createState() => _SubmitButtomState();
}

class _SubmitButtomState extends State<SubmitButtom> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width * 0.85,
      height: 45,
      
      child:RaisedButton(
              child: Text('Submit',
              style: TextStyle(color: Colors.deepPurple[900] , fontSize: 15.0),
            ),
              color: Colors.greenAccent[400],
              
              shape: RoundedRectangleBorder( borderRadius: new BorderRadius.circular(25.0),
           ),
              onPressed: 
              
                (){
                  // Navigator.pop(context);
                  // Navigator.pushNamed(context, '/home');
                  print(nationalCode.text);
                  // Navigator.popAndPushNamed(context, '/home');
                }
              
      
    )
    );
     
  }
  // @override
  // void dispose(){
  //   // nationalCode.clear();
  //   nationalCode.dispose();
  //   super.dispose();
  // }
}

class Nationalcard extends StatefulWidget {
  @override
  _NationalcardState createState() => _NationalcardState();
}

class _NationalcardState extends State<Nationalcard> {
   
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: TextField(
        controller: nationalCode,
        textInputAction: TextInputAction.go,
        keyboardType: TextInputType.number,

        
        decoration: InputDecoration(icon: Icon(Icons.person, color: Colors.black,),
        border: InputBorder.none,
        hintText: 'National Code' ,
        ),
        // onSubmitted: ,
        ),
      height: 45,
      width: MediaQuery.of(context).size.width * 0.85,
      
      //width: 70,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(shape: BoxShape.rectangle, borderRadius: new BorderRadius.circular(15),color: Colors.white,),

      
    );
  }
}