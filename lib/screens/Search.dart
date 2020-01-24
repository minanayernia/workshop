import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workshop/widgets/topbar.dart';
import 'package:workshop/widgets/workshop_card.dart';
import 'package:workshop/widgets/mmd.dart';
import 'package:workshop/models/workshop.dart';
import 'package:workshop/widgets/search_input.dart' as MySearchInput;
import 'package:workshop/widgets/workshop_search.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: FutureBuilder(
        future: getedovomi(),
        builder: (context,snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Center(
          child: Column(
            children: <Widget>[
              SearchAppBar(),
            ],
          ),
        );
              break;
            default:
            return AlertDialog(
                backgroundColor: Colors.transparent,
                content: Container(
                  height: 100,
                  width: 100,
                  color: Colors.transparent,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            );
          }
        },),);
      
    
  }
}



class SearchAppBar extends StatefulWidget {
  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 8),
      height: 50,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      // child: Container(
      //   height: 30,
      //   width: MediaQuery.of(context).size.width * 0.8,
      //   margin: EdgeInsets.only(left: 20 , bottom: 5),
      //   child: TextField(
      //     cursorColor: Colors.deepPurple,
      //     textInputAction: TextInputAction.go,
      //     keyboardType: TextInputType.text,
      //     style: TextStyle(color: Colors.deepPurple , fontSize: 20.0),
      //     decoration:
      //         InputDecoration(border: InputBorder.none, hintText: 'Search' , 
      //         hintStyle: TextStyle(color: Colors.deepPurple) ),
      //   ),
      // ),

      child: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            MySearchInput.showSearch(
                                    cursorColor: Theme.of(context).accentColor,
                                    hintText: "search",
                                    context: context,
                                    delegate: WorkshopSearch(
                                        workshops: wsh))
                                .then((value) {
                              if (value != null) {
                                Navigator.of(context).pushNamed(
                                    '/workshop',
                                    arguments: value);
                              }
                            });
                          }),
    );

  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
///Search algoritm
List<Workshop> allWorkshops = [] ;
List<Workshop> result = [] ;


void searchWorkshop(String name){
  int i = 0 ;
  for (i = 0 ; i < allWorkshops.length ; i++){
    String workshopName = allWorkshops[i].name ;
    if (workshopName.contains(name)){
      result.add(allWorkshops[i]);
    }
  }
}
