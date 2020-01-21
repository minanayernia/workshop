import 'package:flutter/material.dart';



class FirstIntroPage extends StatefulWidget {
  @override
  _FirstIntroPageState createState() => _FirstIntroPageState();
}

class _FirstIntroPageState extends State<FirstIntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor ,
      body: 
      Container(child: Center(
        child: Stack
       (children: <Widget>[
          IntroContent(),
          Dokhtaroo() ,
          IntroTextBox(),
          DownButton(),
          ColoryShapes(),
       ],)
            
      ),)
      

    
      
    );
  }
}

class IntroContent extends StatefulWidget {
  @override
  _IntroContentState createState() => _IntroContentState();
}

class _IntroContentState extends State<IntroContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *1,
      height: MediaQuery.of(context).size.height *0.98,
      child:Center(
        child: Image(image: AssetImage('assets/intro-bg.png'),),
       
      ) ,
      
      
    );
  }
}

class Dokhtaroo extends StatefulWidget {
  @override
  _DokhtarooState createState() => _DokhtarooState();
}

class _DokhtarooState extends State<Dokhtaroo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *0.7,
      height: MediaQuery.of(context).size.height *0.6,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.05 , left:  MediaQuery.of(context).size.width *0.05),
      child:Center(
        child: Image(image: AssetImage('assets/dokhtare.png'),),
       
      ) ,
      
    );
  }
}

class IntroTextBox extends StatefulWidget {
  @override
  _IntroTextBoxState createState() => _IntroTextBoxState();
}

class _IntroTextBoxState extends State<IntroTextBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6 ,
      width:  MediaQuery.of(context).size.width *0.4 ,
      margin:EdgeInsets.only(top: MediaQuery.of(context).size.height *0.58 , left: MediaQuery.of(context).size.width *0.5 ) ,
      child: Column(
        children: <Widget>[
          Container(
            child: Text('LEARNOO', style: TextStyle(fontSize: 30 , color: Colors.greenAccent[400] , fontStyle: FontStyle.italic )),
          ),
          Container(
            child: Text('Start learning easily with LEARNOO ' , style: TextStyle(fontSize: 18 , color: Colors.white),),
          ),
        ],
      ),
      
    );
  }
}

class DownButton extends StatefulWidget {
  @override
  _DownButtonState createState() => _DownButtonState();
}

class _DownButtonState extends State<DownButton> {
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
                  Navigator.pushNamed(context, '/intro2');
                }
      )
    );
  }

}

class ColoryShapes extends StatefulWidget {
  @override
  _ColoryShapesState createState() => _ColoryShapesState();
}

class _ColoryShapesState extends State<ColoryShapes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.93 , left: MediaQuery.of(context).size.width *0.1 ),
      child: Row(children: <Widget>[
        Container(
          width:30 ,
          height: 10 ,
          child: null,
          decoration: BoxDecoration(shape: BoxShape.rectangle , borderRadius: BorderRadius.circular(10) , color: Colors.greenAccent),
        ) ,
        Padding(padding: EdgeInsets.only(left: 5)),
        Container(
          width: 10,
          height:10 ,
          decoration: BoxDecoration(shape: BoxShape.circle , color: Colors.deepPurple[900])
        )
      ],),
      
    );
  }
}