import 'package:flutter/material.dart';
import 'package:wipod/pages/ambientSections.dart';
import 'package:wipod/pages/section.dart';

class AmbientPage extends StatefulWidget {
  final VoidCallback onBackButtonPressed;
  final VoidCallback onColorPressed;

  // Constructor for AmbientPage
  const AmbientPage({
    Key? key,
    required this.onBackButtonPressed,
    required this.onColorPressed,
  }) : super(key: key);

  @override
  _AmbientPageState createState() => _AmbientPageState();
}

class _AmbientPageState extends State<AmbientPage> {
  bool isAmbientModeOn = false; // Initial state

  @override
  Widget build(BuildContext context) {
    // Initialize sections within build method
    final List<Widget> sections = [
      SectionWidget1(),
      SectionLine(),
      BrightnessWidget(),
      SectionLine(),
      ThemeWidget(onColorPressed: widget.onColorPressed), // Correctly accessing the widget property here
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ambient Mode',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: widget.onBackButtonPressed, // Accessing the widget's properties
        ),
        actions: <Widget>[
          Switch(
            value: isAmbientModeOn,
            onChanged: (value) {
              setState(() {
                isAmbientModeOn = value; // Updating the state correctly
              });
            },
            activeColor: Colors.white,
            activeTrackColor: Colors.blue,
            inactiveTrackColor: Colors.grey,
            inactiveThumbColor: Colors.white,
          ), SizedBox(width:20),
        ],
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
