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
      appBar: AppBar(title: Text('profile',)),
      backgroundColor:Color(12),
      body: ProCard(),
    );
  }
}