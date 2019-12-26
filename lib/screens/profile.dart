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
      appBar: AppBar(title: Text('profile',) ,
      backgroundColor: Colors.deepPurple[700],
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(200),
        bottom: Radius.circular(200),
      ),
    ),
    
    ),
      
      body: ProCard(),
    );
  }
}