
import 'package:flutter/material.dart';
import 'package:wipod/pages/climateSections.dart';

class ClimatePage extends StatelessWidget {

  final List<Widget> sections = [
    SectionWidget1(),
    SectionWidget2(),
    SectionWidget3(),

  ];

  final VoidCallback onBackButtonPressed;

  ClimatePage({required this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
        title: Text('Climate Page'),
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
