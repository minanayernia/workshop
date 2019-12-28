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
          child: ClipPath(
        child: Stack(
        overflow: Overflow.clip,
        // fit: StackFit.loose,
        children: <Widget>[
            BackCircle(),
            PersonCard(),
            BackInsideCircle(),
            FrontInsideCircle(),
        ],
      
      ),
      // clipper: MmdClipper(),
      clipBehavior: Clip.hardEdge,
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
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        // color: Colors.red,
        height: 140,
        width: 260,
        margin: EdgeInsets.only(top:30 ),
      // color: Colors.blue,
       alignment: Alignment.center,
      child: Container(
      width: 260,height: 140,
      alignment: FractionalOffset.center,
      child: Row(children: <Widget>[
        Container(width: 50,height: 80,
        margin: EdgeInsets.only(left: 20), 
        decoration: BoxDecoration(color:Colors.red ,borderRadius: BorderRadius.circular(10)),),
        Container(
          height: 80,
          margin: EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(child: Text('Sina Saeedi'),),
             Container(child: Text('1234567890'),margin: EdgeInsets.only(top: 10),),
              Container(child: Text('09171158076'),margin: EdgeInsets.only(top: 10),)
              ],
          ),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.start,),
      decoration: BoxDecoration(color: Colors.grey[400], shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(10)
       , ),
        ),
        ),]
    );
      
  }
}

// class BackCircle extends StatefulWidget {
//   @override
//   _BackCircleState createState() => _BackCircleState();
// }

// class _BackCircleState extends State<BackCircle> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//         alignment: Alignment.center,
//         // color: Colors.red,
//         height: 200,
//         margin: EdgeInsets.only(top: 0, ),
//         child: CircleAvatar( radius: 100, backgroundColor: Colors.greenAccent[400] ),
//       );
//   }
// }


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