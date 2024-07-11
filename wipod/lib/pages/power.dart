
import 'package:flutter/material.dart';
import 'package:wipod/pages/powerSections.dart';


class PowerPage extends StatelessWidget {


  final VoidCallback onBackButtonPressed;

  final List<Widget> sections = [
    SectionWidget1(),
    SectionWidget2(),
    SectionWidget3(),
  ];


  PowerPage({required this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
            title: Text('Power Page'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: onBackButtonPressed,
            )),

      body: ListView.builder(
       itemCount: sections.length,
        itemBuilder: (context, index){
         return sections[index];
        },
      ),
    );
  }
}
