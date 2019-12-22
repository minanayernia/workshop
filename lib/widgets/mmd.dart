import 'package:flutter/material.dart';

class MmdCard extends StatefulWidget {
  @override
  _MmdCardState createState() => _MmdCardState();
}

class _MmdCardState extends State<MmdCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      margin: const EdgeInsets.symmetric(
         vertical: 10.0,
         horizontal: 14.0,
       ),
       height: 110,
      child: Stack(
        children: <Widget>[
          CardThumb(),
          CardPic(),
        ],
      ),
    );
  }
}



class CardPic extends StatefulWidget {
  @override
  _CardPicState createState() => _CardPicState();
}

class _CardPicState extends State<CardPic> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      // height: 150,
      // color: Colors.white,
        // width: MediaQuery.of(context).size.width * 0.8,
    //     margin: new EdgeInsets.symmetric(
    //    vertical: 16.0
    //  ),
        alignment: FractionalOffset.centerLeft,
        child: Image(image: AssetImage('assets/pc.png'), height: 80,width: 80,),
    ));
  }
}


class CardThumb extends StatefulWidget {
  @override
  _CardThumbState createState() => _CardThumbState();
}

class _CardThumbState extends State<CardThumb> {


  @override
  Widget build(BuildContext context) {
    return Center(
          child: Container(
       height: 110.0,
       margin: new EdgeInsets.only(left: 40.0,right: 20),
       decoration: new BoxDecoration(
         color: new Color(0xFF333366),
        // color: colors[random.nextInt(3)][random.nextInt(2)],
         shape: BoxShape.rectangle,
         borderRadius: new BorderRadius.circular(8.0),
         boxShadow: <BoxShadow>[
           new BoxShadow(  
            color: Colors.black12,
            blurRadius: 100.0,
            offset: new Offset(0.0, 50.0),
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(left: 70),
        child: Row(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                // color: Colors.red,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 20, left: 0),
                child: Text('Python', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
              ),
              Container(
                // color: Colors.green,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 0, top: 2),
                child: Text('version 2.7', style: TextStyle(color: Colors.grey)),
              ),
              Container(
                margin: EdgeInsets.only(top: 2),
                decoration: BoxDecoration(shape: BoxShape.rectangle, borderRadius: new BorderRadius.circular(8.0),color: Colors.green),
                // color: Colors.green,
                height: 5,
                width: 60,
                child: Text(''),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(children: <Widget>[
                  Icon(Icons.people, size: 20,color: Colors.grey,),
                  Padding(padding: EdgeInsets.all(2),),
                  Text('74', style: TextStyle(color: Colors.grey),),
                  Padding(padding: EdgeInsets.all(10),),
                  Icon(Icons.access_time, size: 20,color: Colors.grey,),
                  Padding(padding: EdgeInsets.all(2),),
                  Text('22:00', style: TextStyle(color: Colors.grey),),

                ],),
              )

            ],
          )
        ],),
      ),
  ),
    );
  }
}