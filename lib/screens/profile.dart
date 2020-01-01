import 'package:flutter/material.dart';
import 'package:workshop/widgets/profileCard.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
    //   appBar: AppBar(title: Container(margin: EdgeInsets.only(right: 100),
    //   child: Text('Profile',)) ,
    //   automaticallyImplyLeading: false,
    //   // leading: Container(),
    //   backgroundColor: Colors.deepPurple[700],
    //   shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.vertical(
    //     top: Radius.circular(200),
    //     bottom: Radius.circular(200),
    //   ),
    // ),
    
    // ),
      
      appBar: MinaAppBar(height: 100),
      body: SingleChildScrollView(child: ProCard()),
    );
  }
}


class MinaAppBar extends StatelessWidget implements PreferredSizeWidget{

  final double height;

  const MinaAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
          child: Center(
                      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
        //  color: Colors.purple
         ),
        child: Center(child: Center(
                  child: AppBar(title: Center(child:Text('maing')),
          automaticallyImplyLeading: false,
          shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
          top: Radius.circular(200),
          bottom: Radius.circular(200),
      ),
          ),
          ),
        ),
        
      ),
          ),)
    );
  }
}