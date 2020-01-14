import 'package:flutter/material.dart';


class ProCard extends StatefulWidget {
  @override
  _ProCardState createState() => _ProCardState();
}

class _ProCardState extends State<ProCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
          child: Column(
            children: <Widget>[
              Stack(
            // overflow: Overflow.clip,
            // fit: StackFit.loose,
            children: <Widget>[
                BackCircle(),
                 PersonPic(),
                PersonCard(),
                // BackInsideCircle(),
                // FrontInsideCircle(),
                
               
            ],
      
      ),

      Container(
        // color: Colors.red,
        height:171 ,
        width:  MediaQuery.of(context).size.width*1 ,
        padding: EdgeInsets.only(left: 10),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start ,
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: <Widget>[
            Text('Participant' , style: TextStyle(color: Colors.white),) ,
            Padding(padding: EdgeInsets.only(top: 5),),
            Container(
              height: 149,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                children: <Widget>[
                  WorkCardDetail(),
                  WorkCardDetail(),
                  WorkCardDetail(),
                  WorkCardDetail(),
                  WorkCardDetail(),
                  WorkCardDetail(),
                  WorkCardDetail(),
                  WorkCardDetail(),
                  WorkCardDetail(),
                  WorkCardDetail(),
                ],
              ),
            ),
            
          ],
        ),
      ),

      Container(
        // color: Colors.red,
        height:173 ,
        margin: EdgeInsets.only(top: 10),
        width:  MediaQuery.of(context).size.width*1 ,
        padding: EdgeInsets.only(left: 10),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start ,
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: <Widget>[
            Text('Supervisor' , style: TextStyle(color: Colors.white),) ,
            Padding(padding: EdgeInsets.only(top: 5),),
            Container(
              height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                children: <Widget>[
                  WorkCardDetail(),
                  WorkCardDetail(),
                  WorkCardDetail(),
                  WorkCardDetail(),
                  WorkCardDetail(),
                  WorkCardDetail(),
                  WorkCardDetail(),
                  WorkCardDetail(),
                ],
              ),
            ),
            
          ],
        ),
      )

            ],
                      
          ),
    );
  }
}



class PersonCard extends StatefulWidget {
  @override
  _PersonCardState createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[ Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10) ,),
        height: 200,
        width: MediaQuery.of(context).size.width * 0.85 ,
        // margin: EdgeInsets.only(top:30 ),
      // color: Colors.blue,
       alignment: Alignment.center,
      child: Container(
        
        // color: Colors.yellow,
      width: 260,height: 140,
      // alignment: FractionalOffset.center,
      child: Row(children: <Widget>[
        
        Container(
          // color: Colors.green,
          height: 80,
          margin: EdgeInsets.only(left: 90),
          
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(child: Text('Sina Saeedi'),),
              Container(child: Text('1234567890'),margin: EdgeInsets.only(top: 10),),
              Container(child: Text('09171158076'),margin: EdgeInsets.only(top: 10),)
              ],
          ),
        ),

        Container(width: 50,height: 80,
        
        margin: EdgeInsets.only(left: 20), 
        decoration: BoxDecoration(color:Colors.grey ,borderRadius: BorderRadius.circular(10)),
        ),
        
      ],
      // mainAxisAlignment: MainAxisAlignment.start,
      ),
      decoration: BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(10)
       , ),
        ),
        ),]
    );
      
  }
}

class BackCircle extends StatefulWidget {
  @override
  _BackCircleState createState() => _BackCircleState();
}

class _BackCircleState extends State<BackCircle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
        alignment: Alignment.center,
        // color: Colors.yellow,
        height: 200,
        // margin: EdgeInsets.only(top: 0, ),
        child: CircleAvatar( radius: 100, backgroundColor: Colors.greenAccent[400] ),
      );
  }
}


// class BackInsideCircle extends StatefulWidget {
//   @override
//   _BackInsideCircleState createState() => _BackInsideCircleState();
// }

// class _BackInsideCircleState extends State<BackInsideCircle> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
  
//       mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget> [ Container(
//             margin: EdgeInsets.only(top: 90),
//             alignment: FractionalOffset.bottomRight,
//         // color: Colors.red,
//         height: 110,
//         width: 330,
        
//         child: CircleAvatar(radius: 55, backgroundColor: Colors.purple[900],),
//       ),]
//     );
//   }
// }

// class FrontInsideCircle extends StatefulWidget {
//   @override
//   _FrontInsideCircleState createState() => _FrontInsideCircleState();
// }

// class _FrontInsideCircleState extends State<FrontInsideCircle> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
  
//       mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget> [ Container(
//             // color: Colors.indigo,
//             margin: EdgeInsets.only(top: 90),
//             alignment: FractionalOffset.centerRight,
//         // color: Colors.red,
//         height: 110,
//         width: 315,
        
//         child: CircleAvatar(radius: 47, backgroundColor: Colors.grey,),
//       ),]
//     );
//   }
// }



// class MmdClipper extends CustomClipper<Path> {
//       @override
//       Path getClip(Size size) {
//         final Path path = new Path();
//         path.lineTo(0.0, size.height / 2);
//         path.lineTo(size.width, size.height / 2);
//         path.lineTo(size.width, 0);
//         return path;
//       }
//       @override
//       bool shouldReclip(CustomClipper<Path> oldClipper) {
//         return true;
//       }
//     }

class PersonPic extends StatefulWidget {
  @override
  _PersonPicState createState() => _PersonPicState();
}

class _PersonPicState extends State<PersonPic> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      // height:MediaQuery.of(context).size.height * 0.35,
      height: 200,
      // color: Colors.red,
      alignment: Alignment.center,
      // width: MediaQuery.of(context).size.width * 0.85,
      margin: EdgeInsets.only(top: 0, ),
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Container(
            child: Image(image: AssetImage('assets/id-card.png'),width: MediaQuery.of(context).size.width * 0.85, height:150,)
            
          ),
            ]
      ),
    );

  }
}

class WorkCardDetail extends StatefulWidget {
  @override
  _WorkCardDetailState createState() => _WorkCardDetailState();
}

class _WorkCardDetailState extends State<WorkCardDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.purple,
          // width: 100,
          height: 150,
          margin: EdgeInsets.only(right: 10),
          child: Stack(
            
        children: <Widget>[
          
          Container(

            width: 100,
            height: 125,
            // padding: EdgeInsets.only(top: 20),
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Colors.deepPurple[700], borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 15),),
              Text('python' , style:TextStyle(color: Colors.white)),
              Text('sa, 05', style:TextStyle(color: Colors.white)),
              Text('boz', style:TextStyle(color: Colors.white)),
              Text('gav', style:TextStyle(color: Colors.white)),
            ],),
            
          ),
          // Padding(padding: EdgeInsets.only(top: 5),),
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(left: 25),
             decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10), image: DecorationImage(image: AssetImage('assets/py.png')))
            
          ),
          

          
        ],
        
      ),
    );
  }
}