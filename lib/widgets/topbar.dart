import 'package:flutter/material.dart';


class TopBar extends StatefulWidget {
  final String foo;
  // injuri ham mituni begi bayad bzare hatman(vali bad bayad khate paiinisho pak kni.):
  // TopBar({@required this.foo}); 
  const TopBar ({Key key, this.foo}): super(key: key);
  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 7 , bottom: 10),
      height: 50,
      width: MediaQuery.of(context).size.width*0.9,
      decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(25)),
      child: Text( "ad"),
      
    );
  }
}