
import 'package:flutter/material.dart';
import 'package:wipod/pages/lightingSections.dart';

class LightingPage extends StatelessWidget {

  final List<Widget> sections = [
    SectionWidget1(),
    SectionWidget2(),
    SectionWidget3(),
  ];

  final VoidCallback onBackButtonPressed;

  LightingPage({required this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Lighting Page'),
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
