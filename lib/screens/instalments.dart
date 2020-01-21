import 'package:flutter/material.dart';
import 'package:workshop/models/Instalment.dart';

int debt = 0 ;
class InstalmentPage extends StatefulWidget {
  @override
  _InstalmentPageState createState() => _InstalmentPageState();
}

class _InstalmentPageState extends State<InstalmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(

        children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 30),),
            //name of participant & instalments left
            Container(
              height: MediaQuery.of(context).size.height*0.1,
              // width:MediaQuery.of(context).size.width*0.9 ,
        child: Row(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height:  MediaQuery.of(context).size.height*0.1,
            width: MediaQuery.of(context).size.width*0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("mina nyr" , style: TextStyle(color: Colors.white , fontSize: 15)  ,),
                Padding(padding: EdgeInsets.only(top: 5),),
                Text("android" ,style: TextStyle(color: Colors.white , fontSize: 15))
              ],
            )),
          Container(
            height: 30,
            width: 100,
            decoration: BoxDecoration(color: Colors.pinkAccent , borderRadius: BorderRadius.circular(15)),
            child: Center(child: Text("2 inst left" , style: TextStyle(color: Colors.white , fontSize: 15),)),
          )
        ],

      ),
            ),
      Padding(padding: EdgeInsets.only(top: 10),),
      Container(
      height:MediaQuery.of(context).size.height*0.8 ,
      width: MediaQuery.of(context).size.width*0.9,
      decoration: BoxDecoration(color: Colors.deepPurple[600] , borderRadius: BorderRadius.circular(15)),
      child: Center(
        
        child: Container(
          width: MediaQuery.of(context).size.width*0.8,
          height: MediaQuery.of(context).size.height*0.7,
          // color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("All instalments" , style: TextStyle(color: Colors.white , fontSize: 15),),
              InstalmentList(),
            ],
          ),
        ),
      ),
            )
          ],
        ),
      
    );
  }
}

class InstalmentCard extends StatefulWidget {
  Instalment inst;
  InstalmentCard({@required this.inst});
  @override
  _InstalmentCardState createState() => _InstalmentCardState();
}

class _InstalmentCardState extends State<InstalmentCard> {
  String selected = "Not Payed" ;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 7),
      height: 60,
      width: MediaQuery.of(context).size.width*0.7,
      decoration: BoxDecoration(color: selected == "Payed" ? Colors.white: Colors.deepPurple , borderRadius: BorderRadius.circular(15)),
      child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width*0.7,
                  child: Row(
          children: <Widget>[
            Container(
                height:60 ,
                width: MediaQuery.of(context).size.width*0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("sat 05 oct" , style: TextStyle(color: selected == "Payed" ? Colors.deepPurple: Colors.white, fontSize: 15),),//Date
                    Text("75 " , style: TextStyle(color: selected == "Payed" ? Colors.deepPurple: Colors.white, fontSize: 15)) ,//price
                  ],
                ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
            if(selected == "Payed"){
              selected = "Not Payed" ;
            }else{
              selected = "Payed" ;
            }
            
          });
              },
                  child: Container(
                  height: 30,
                  width:MediaQuery.of(context).size.width*0.2 ,
                  decoration: BoxDecoration(color: selected == "Payed" ? Colors.greenAccent[400]: Colors.deepPurple[600] , borderRadius: BorderRadius.circular(19)),
                  child: Center(child: Text(selected ,style: TextStyle(color: Colors.deepPurple),),),
              ),
            )
          ],
        ),
              ),
      ),
      
    );
  }
}

class InstalmentList extends StatefulWidget {
  @override
  _InstalmentListState createState() => _InstalmentListState();
}

class _InstalmentListState extends State<InstalmentList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      height: MediaQuery.of(context).size.height*0.65,
      // child: ListView(
      //   scrollDirection: Axis.vertical,
      //   children: <Widget>[
      //     InstalmentCard(),
      //     InstalmentCard(),
      //     InstalmentCard(),
      //     InstalmentCard(),
      //     InstalmentCard(),
      //   ],
      // ),
      child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (_, i) => InstalmentCard(inst: r[i]),
              itemCount: r.length,
            ),
      
    );
  }
}