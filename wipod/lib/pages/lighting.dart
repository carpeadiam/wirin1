
import 'package:flutter/material.dart';
import 'package:wipod/pages/lightingSections.dart';
import 'package:wipod/pages/section.dart';

class LightingPage extends StatelessWidget {
  final List<Widget> sections;
  final VoidCallback onBackButtonPressed;
  final VoidCallback onCustomizePressed;
  final VoidCallback onCustomizePressed2;

  LightingPage({Key? key, required this.onBackButtonPressed, required this.onCustomizePressed,required this.onCustomizePressed2})
      : sections = [
    DefaultLightingWidget(),
    SectionLine(),
    AmbientModeWidget(onCustomizePressed: onCustomizePressed), // Pass the callback here
    SectionLine(),
    MusicModeWidget(onCustomizePressed2: onCustomizePressed2),
    SectionLine(),
    WeatherModeWidget(),
  ],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lighting',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: onBackButtonPressed,
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
