import 'package:flutter/material.dart';
import 'package:workshop/widgets/workshop_image_box.dart';

class WorkshopCard extends StatefulWidget {
  @override
  _WorkshopCardState createState() => _WorkshopCardState();
}

class _WorkshopCardState extends State<WorkshopCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 20),), 
      Card(
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width * 0.8,
        
        child: Row(children: <Widget>[
          Padding(padding:EdgeInsets.all(110)),
          Column(children: <Widget>[
            Padding(padding:EdgeInsets.only(top: 20)),
            Padding(padding:EdgeInsets.only(right: 20)),
            Text('mina'),
            Text('bHr'),
            Text('mmd')
          ],),
         ImageBox(),

          //Icon(Icons.add_a_photo , size: 30,),
        ],),

      
      ),
        
      )]),
    );
      
  }
}