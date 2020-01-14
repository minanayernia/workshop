import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:workshop/screens/login.dart';
import 'package:workshop/widgets/topbar.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
              child: Column(
          children: <Widget>[
            TopBar() ,
            PaymentBox()


          ],
        ),
      ),
      
    );
  }
}

class PaymentBox extends StatefulWidget {
  int number = 0 ;

  @override
  _PaymentBoxState createState() => _PaymentBoxState();
}

class _PaymentBoxState extends State<PaymentBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.85,
      width:MediaQuery.of(context).size.width*0.9 ,
      decoration: BoxDecoration(color: Colors.deepPurple[700] , borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 10),),
          Text("Workshop name" , style: TextStyle(color: Colors.white , fontSize: 15),),
          Container(
            height: MediaQuery.of(context).size.height*0.3,
            width: MediaQuery.of(context).size.width*0.6,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/payment.png"))
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text("Installment" , style: TextStyle(color: Colors.white , fontSize: 15),)
            ),
          Container(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                height: 30,
                minWidth: 30,
                
                child: RaisedButton(
                  color: Colors.pinkAccent,
                  child: Text("-" , style: TextStyle(fontSize: 30 , color: Colors.white),),
                  onPressed: (){},
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5 ,right: 5),
                height:40 ,
                width:MediaQuery.of(context).size.width*0.5 ,
                decoration: BoxDecoration(color: Colors.deepPurple , borderRadius: BorderRadius.circular(15)),
                child: Center(child: Text("2" , style: TextStyle(color: Colors.white , fontSize: 30),),),
              ),
              ButtonTheme(
                
                 height: 30,
                minWidth: 30,
                
                child: RaisedButton(
                  color: Colors.pinkAccent,
                  
                  child: Text("+" , style: TextStyle(fontSize: 30 , color: Colors.white),),
                  onPressed: (){},
                ),
                
              )
            ],
          ),),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width*0.7,
            height:MediaQuery.of(context).size.height*0.1 ,
            decoration: BoxDecoration(color: Colors.deepPurple ,borderRadius: BorderRadius.circular(15) ),
            child:Center(
                
                child: Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  height:MediaQuery.of(context).size.height*0.1 ,
                    child: ListView(
                  scrollDirection: Axis.vertical ,
                  children: <Widget>[
                    Text("sat   05  oct " , style: TextStyle(color: Colors.white , fontSize: 15 ),),
                    Text("sat   05  oct " , style: TextStyle(color: Colors.white , fontSize: 15 ),),
                    Text("sat   05  oct " , style: TextStyle(color: Colors.white , fontSize: 15 ),),
                    Text("sat   05  oct " , style: TextStyle(color: Colors.white , fontSize: 15 ),),
                  ],
              ),
                ),
            ),

          ),
        SubmmitButton() ,
        ],
      ),
    );
  }
}

class SubmmitButton extends StatefulWidget {
  @override
  _SubmmitButtonState createState() => _SubmmitButtonState();
}

class _SubmmitButtonState extends State<SubmmitButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2),
        child: ButtonTheme(
        minWidth: MediaQuery.of(context).size.width * 0.8,
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
                    Navigator.popAndPushNamed(context, '/login');
                  }
                
        
      )
      ),
    );
  }
}