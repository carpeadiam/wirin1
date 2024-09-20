
import 'package:flutter/material.dart';
import 'package:wipod/pages/controlSections.dart';
import 'package:wipod/pages/section.dart';
import 'package:wipod/pages/settings.dart';


class ControlsPage extends StatelessWidget {



  ControlsPage();

  final List<Widget> sections = [
    CarStatusWidget(),
    SectionLine(),
    FrunkAndTrunkControls(),
    SectionLine(),
    RemoteStartAndCarFinderControls(),

  ];


@override
Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: Text('Wipod',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
        )),
    backgroundColor: Colors.white,
    elevation: 0.1,
    centerTitle: true,
      actions: [
  IconButton(
  icon: Icon(Icons.menu),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  },
  tooltip: 'Settings',
),]
  ),


body: ListView.builder(
  itemCount: sections.length,
  itemBuilder: (context, index){
    return sections[index];
  },
),
);
}
}
