import 'dart:ui';

import 'package:flutter/material.dart';
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
  @override
  _PaymentBoxState createState() => _PaymentBoxState();
}

class _PaymentBoxState extends State<PaymentBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.85,
      width:MediaQuery.of(context).size.width*0.9 ,
      decoration: BoxDecoration(color: Colors.deepPurple[700]),
      child: Column(
        children: <Widget>[
          Text("Workshop name" , style: TextStyle(color: Colors.white , fontSize: 15),),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/payment.png"))
            ),
          ),
          Text("Installment"),
          Container(child: Row(
            children: <Widget>[
              ButtonTheme(
                height: 20,
                minWidth: 20,
                child: RaisedButton(
                  child: Text("-" , style: TextStyle(fontSize: 20),),
                  onPressed: (){},
                ),
              ),
              Container(
                height:20 ,
                width:MediaQuery.of(context).size.width*0.5 ,
              ),
              ButtonTheme(
                 height: 20,
                minWidth: 20,
                child: RaisedButton(
                  child: Text("-" , style: TextStyle(fontSize: 20),),
                  onPressed: (){},
                ),
              )
            ],
          ),)
        ],
      ),
      
    );
  }
}