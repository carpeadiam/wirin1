import 'package:flutter/material.dart';
import 'package:wipod/pages/musicSections.dart';
import 'package:wipod/pages/section.dart';

class MusicPage extends StatefulWidget {
  final VoidCallback onBackButtonPressed;

  // Constructor for MusicPage
  const MusicPage({Key? key, required this.onBackButtonPressed}) : super(key: key);

  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  bool isMusicModeOn = false; // Initial state

  // List of sections to display in ListView
  final List<Widget> sections = [
    SectionWidget1(),
    SectionLine(),
    BrightnessWidget(),
    SectionLine(),
    SyncSpotifyWidget(),
    SectionLine(),
    SyncAppleMusicWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Music Mode',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: widget.onBackButtonPressed, // Accessing the widget's properties
        ),
        actions: <Widget>[
          Switch(
            value: isMusicModeOn,
            onChanged: (value) {
              setState(() {
                isMusicModeOn = value; // Updating the state correctly
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
