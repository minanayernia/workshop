import 'package:flutter/material.dart';
import 'package:workshop/screens/intro1.dart';

class SecondIntroPage extends StatefulWidget {
  @override
  _SecondIntroPageState createState() => _SecondIntroPageState();
}

class _SecondIntroPageState extends State<SecondIntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor ,
      body: Container(child: Stack(children: <Widget>[
        IntroContent(),
        Pesaroo(),
        IntroText2(),
        DownButton2(),
        ColoryShaps2()
      ],),),
      
    );
  }
}

class Pesaroo extends StatefulWidget {
  @override
  _PesarooState createState() => _PesarooState();
}

class _PesarooState extends State<Pesaroo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.red,
        width: MediaQuery.of(context).size.width *0.9,
      height: MediaQuery.of(context).size.height *0.45,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height* 0.13, left:  MediaQuery.of(context).size.width *0.08),
        child:Center(
          child: Image(image: AssetImage('assets/pesare.png'),),
         
        
        
      ),
    );
  }
}

class IntroText2 extends StatefulWidget {
  @override
  _IntroText2State createState() => _IntroText2State();
}

class _IntroText2State extends State<IntroText2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6 ,
      width:  MediaQuery.of(context).size.width *0.4 ,
      margin:EdgeInsets.only(top: MediaQuery.of(context).size.height *0.6 , left: MediaQuery.of(context).size.width *0.5 ) ,
      child: Column(
        children: <Widget>[
          Container(
            child: Text('LEARNOO', style: TextStyle(fontSize: 50 , color: Colors.greenAccent[400] , fontStyle: FontStyle.italic)),
          ),
          Container(
            child: Text('LEARNOO provide you amazing experience ...' , style: TextStyle(fontSize: 18 , color: Colors.white),),
          ),
        ],
      ),
      
      
    );
  }
}
class ColoryShaps2 extends StatefulWidget {
  @override
  _ColoryShaps2State createState() => _ColoryShaps2State();
}

class _ColoryShaps2State extends State<ColoryShaps2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.93 , left: MediaQuery.of(context).size.width *0.1 ),
      child: Row(children: <Widget>[
        Container(
          width: 10,
          height:10 ,
          decoration: BoxDecoration(shape: BoxShape.circle , color: Colors.deepPurple[900])
        ),
        Padding(padding: EdgeInsets.only(left: 5)),
        Container(
          width:30 ,
          height: 10 ,
          child: null,
          decoration: BoxDecoration(shape: BoxShape.rectangle , borderRadius: BorderRadius.circular(10) , color: Colors.greenAccent),
        ) ,
        
        
      ],),
      
      
    );
  }
}

class DownButton2 extends StatefulWidget {
  @override
  _DownButton2State createState() => _DownButton2State();
}

class _DownButton2State extends State<DownButton2> {
  @override
  Widget build(BuildContext context) {
    return Container(
       height: 40 ,
      width: 90,
      margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height *0.9 , left: MediaQuery.of(context).size.width *0.65 ),
      child: RaisedButton(
        child: Text('>',
              style: TextStyle(color: Colors.redAccent , fontSize: 30.0),
            ),
              color: Colors.white,
              
              shape: RoundedRectangleBorder( borderRadius: new BorderRadius.circular(25.0),
      ),
      onPressed: 
              
                (){
                  // Navigator.pop(context);
                  // Navigator.pushNamed(context, '/home');
                  Navigator.pushNamed(context, '/home');
                }
      )
      
    );
  }
}