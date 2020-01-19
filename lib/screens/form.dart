import 'package:flutter/material.dart';
import 'package:workshop/widgets/background.dart';
import 'package:workshop/widgets/topbar.dart';

bool pressAttention = false ;

List<String> DAns = [];
List<String> TAns = [];

final ans = TextEditingController();

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      // body:,
      // appBar: PreferredSize(
        
      //   preferredSize: Size(null, 70),
      //   child: Container(
      //     color: Colors.red,
      //     width: MediaQuery.of(context).size.width,
      //     // width: 300,
      //     height: 100,
      //     child: ClipRRect(
            
      //       borderRadius: BorderRadius.only(
      //           bottomLeft: Radius.circular(25),
      //           bottomRight: Radius.circular(15),
      //           topLeft:Radius.circular(15) ,
      //           topRight: Radius.circular(50)
      //       ),
      //       child: Container(
              
      //         color: Colors.blueAccent,
      //         child: Container(
      //           color: Colors.yellow,
      //           margin: EdgeInsets.fromLTRB(15, 40,15, 0),
                
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Icon(Icons.navigate_before,size: 40,color: Colors.white,),
      //               Text("Foodbar",style: TextStyle(fontSize: 30,color: Colors.white),),
      //               Icon(Icons.navigate_before,color: Colors.transparent,),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      body: Column(
        children: <Widget>[
          TopBar(foo: "hi",) ,
          FormCard(),
          SubmmitButton(),
        ],
      )
      // bottomNavigationBar: ,
    );
  }
}

class Appbar extends StatefulWidget {
  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      // width: ,
      child: Text("Android workshop form" , style: TextStyle(color: Colors.purpleAccent),),
      decoration: BoxDecoration(color: Colors.white,
      borderRadius: BorderRadius.circular(12)
      
      
    )
    );
  }
}

class AppBarContainer extends StatefulWidget {
  @override
  _AppBarContainerState createState() => _AppBarContainerState();
}

class _AppBarContainerState extends State<AppBarContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 100,
      // width: ,
      child: Text("Android workshop form" , style: TextStyle(color: Colors.purpleAccent),),
      decoration: BoxDecoration(color: Colors.white,
      borderRadius: BorderRadius.circular(12)
      
      
    )
      
    );
  }
}

class FormCard extends StatefulWidget {
  @override
  _FormCardState createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10) , color: Colors.white,),
        
        height:MediaQuery.of(context).size.height*0.8 ,
        width:MediaQuery.of(context).size.width*0.9 ,
        child: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
                DescriptiveQuestion() ,
                TestQuestion(),
                DescriptiveQuestion() ,
                TestQuestion(),
                DescriptiveQuestion() ,
                TestQuestion(),
                DescriptiveQuestion() ,
                TestQuestion(),
            ],
          ), 

        ),
        
        
      ),
    );
  }
}

class DescriptiveQuestion extends StatefulWidget {
  @override
  _DescriptiveQuestionState createState() => _DescriptiveQuestionState();
}

class _DescriptiveQuestionState extends State<DescriptiveQuestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[300]),
      width: MediaQuery.of(context).size.width*0.6,
      margin: EdgeInsets.only(left: 6 , right: 6 , top: 7),
      child: Column(
        children: <Widget>[
          Question(),
          DesciptiveAnswer() ,

        ],
      ),
      
    );
  }
}

class Question extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10 , bottom: 10),
      child: Text("what is the question?" , style: TextStyle(color: Colors.deepPurple),),
      
    );
  }
}

class DesciptiveAnswer extends StatefulWidget {
  @override
  _DesciptiveAnswerState createState() => _DesciptiveAnswerState();
}

class _DesciptiveAnswerState extends State<DesciptiveAnswer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.79,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(color: Colors.grey[350] , borderRadius: BorderRadius.circular(10)),
      child: TextField(
        textInputAction: TextInputAction.go,
        keyboardType: TextInputType.text ,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "   Answer..."
        ),
      ),
      
    );
  }
}

class TestQuestion extends StatefulWidget {
  @override
  _TestQuestionState createState() => _TestQuestionState();
}

class _TestQuestionState extends State<TestQuestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[300] , borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(left:6 , right:6 ,top: 7 ),
      child: Column(
        children: <Widget>[
          Question(),
          TestAnswer()
        ],
      ),
      
    );
  }
}

class TestAnswer extends StatefulWidget {
  @override
  _TestAnswerState createState() => _TestAnswerState();
}

class _TestAnswerState extends State<TestAnswer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          Option(),
          Padding(padding: EdgeInsets.only(left: 5),),
          Option()
        ],
      ),
      
    );
  }
}
class Option extends StatefulWidget {
  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(

      minWidth: MediaQuery.of(context).size.width*0.4,
      height: 35,
      child: RaisedButton(
        
        child: Text("first",
        style: TextStyle(color: Colors.white),),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: pressAttention ? Colors.deepPurple : Colors.greenAccent[400],
        onPressed: ()=> setState(() => pressAttention = !pressAttention)
        

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
      margin: EdgeInsets.only(top: 7),
          child: ButtonTheme(
        minWidth: MediaQuery.of(context).size.width * 0.9,
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


