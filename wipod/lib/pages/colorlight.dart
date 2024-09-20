import 'package:flutter/material.dart';
import 'package:wipod/pages/colorlightSections.dart';
import 'package:wipod/pages/section.dart';

class ColorLightPage extends StatefulWidget {
  final VoidCallback onBackButtonPressed;

  // Constructor for ColorLightPage
  const ColorLightPage({Key? key, required this.onBackButtonPressed}) : super(key: key);

  @override
  _ColorLightPageState createState() => _ColorLightPageState();
}

class _ColorLightPageState extends State<ColorLightPage> {
  bool isColorLightModeOn = false; // Initial state

  // List of sections to display in ListView
  final List<Widget> sections = [
    ColorPickerWidget(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Theme',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w200,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: widget.onBackButtonPressed, // Accessing the widget's properties
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) {
          return sections[index];
        },
      ),
    );
  }
}
