
import 'package:flutter/material.dart';
import 'package:wipod/pages/locationSections.dart';
import 'package:wipod/pages/section.dart';

class LocationPage extends StatelessWidget {

  final List<Widget> sections = [
    LocationSearchWidget(),
    SectionLine(),
    SavedLocationsWidget(),
    SectionLine(),
    LocateChargerWidget(),
  ];

  final VoidCallback onBackButtonPressed;

  LocationPage({required this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar:  AppBar(
            title: Text('Location',style: TextStyle(color:Colors.black,fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,),),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: onBackButtonPressed,
            ) , backgroundColor: Colors.white,
            shadowColor: Colors.black, surfaceTintColor: Colors.white),

      body: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index){
          return sections[index];
        },
      ),
    );
  }
}
