import 'package:flutter/material.dart';
import 'package:workshop/main.dart';
import 'package:workshop/screens/workshop-details.dart';
import 'package:workshop/widgets/background.dart';
import 'package:workshop/widgets/TA_ImageCard.dart';
import 'package:workshop/widgets/GroupCard.dart';
import 'package:workshop/widgets/ParticipantCard.dart';
import 'package:workshop/widgets/TARequestCard.dart';
import 'package:workshop/screens/workshop-details-supervisor.dart';


class WorkshopDetailsTA extends StatefulWidget {
  @override
  _WorkshopDetailsTAState createState() => _WorkshopDetailsTAState();
}

class _WorkshopDetailsTAState extends State<WorkshopDetailsTA> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Background(),
        Page() ,
      ],
      
    );
  }
}


class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Workshopimage() ,
         
      ],
      
    );
  }
}


