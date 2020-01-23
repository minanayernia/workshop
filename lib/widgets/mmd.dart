import 'package:flutter/material.dart';
import 'package:workshop/models/workshop.dart';

class MmdCard extends StatefulWidget {
  Workshop mmdworkshop;
  MmdCard({@required this.mmdworkshop});

  @override
  _MmdCardState createState() => _MmdCardState();
}
class _MmdCardState extends State<MmdCard> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/workshop', arguments: widget.mmdworkshop); //go to workshop details
      },
          child: Container(
        // color: Colors.red,
        margin: const EdgeInsets.symmetric(
           vertical: 10.0,
           horizontal: 14.0,
         ),
         height: 110,
        child: Stack(
          children: <Widget>[
            CardThumb(mmdworkshop: widget.mmdworkshop,),
            CardPic(mmdworkshop: widget.mmdworkshop,),
          ],
        ),
      ),
    );
  }
}



class CardPic extends StatefulWidget {
  Workshop mmdworkshop;
  CardPic({@required this.mmdworkshop});

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
  Workshop mmdworkshop;
  CardThumb({@required this.mmdworkshop});

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
         color: Colors.deepPurple[700].withOpacity(0.8),
        // color: colors[random.nextInt(3)][random.nextInt(2)],
         shape: BoxShape.rectangle,
         borderRadius: new BorderRadius.circular(8.0),
        //  boxShadow: <BoxShadow>[
        //    new BoxShadow(  
        //     color: Colors.black12,
        //     blurRadius: 100.0,
        //     offset: new Offset(0.0, 50.0),
        //   ),
        // ],
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
                child: Text(widget.mmdworkshop.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
              ),
              Container(
                // color: Colors.green,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 0, top: 2),
                child: Text(widget.mmdworkshop.supervisor, style: TextStyle(color: Colors.grey)),
              ),
              Container(
                margin: EdgeInsets.only(top: 2),
                
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
                  Text(widget.mmdworkshop.capacity.toString(), style: TextStyle(color: Colors.grey),),
                  Padding(padding: EdgeInsets.all(10),),
                  Icon(Icons.access_time, size: 20,color: Colors.grey,),
                  Padding(padding: EdgeInsets.all(2),),
                  Text(widget.mmdworkshop.time, style: TextStyle(color: Colors.grey),),

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