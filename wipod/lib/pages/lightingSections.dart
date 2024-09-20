import 'package:flutter/material.dart';
import 'package:wipod/pages/ambient.dart';
import 'package:wipod/pages/base.dart';
import 'package:flutter_svg/flutter_svg.dart';




class DefaultLightingWidget extends StatefulWidget {
  @override
  _DefaultLightingWidgetState createState() => _DefaultLightingWidgetState();
}

class _DefaultLightingWidgetState extends State<DefaultLightingWidget> {
  bool isDefaultLightingOn = true;
  double brightnessLevel = 0.5;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 31, top: 8.0, right: 36.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/defaultLighting.svg', // Replace with your SVG asset path

                    ),
                    SizedBox(width: 8),
                Text(
                  'Default Lighting',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )]),
                Switch(
                  value: isDefaultLightingOn,
                  onChanged: (value) {
                    setState(() {
                      isDefaultLightingOn = value;
                    });
                  },
                  activeColor: Colors.white,
                  activeTrackColor: Colors.blue,
                  inactiveTrackColor: Colors.grey,
                  inactiveThumbColor: Colors.white,


                ),
              ],
            ),
            Text(
              'White light for focused driving.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Slider(
              value: brightnessLevel,
              onChanged: (value) {
                setState(() {
                  brightnessLevel = value;
                });
              },
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
              thumbColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}



class AmbientModeWidget extends StatefulWidget {
  final VoidCallback onCustomizePressed;

  AmbientModeWidget({Key? key, required this.onCustomizePressed}) : super(key: key);

  @override
  _AmbientModeWidgetState createState() => _AmbientModeWidgetState();
}

class _AmbientModeWidgetState extends State<AmbientModeWidget> {
  bool isAmbientModeOn = false;
  double brightnessLevel = 0.5;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 31, top: 8.0, right: 36.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/ambientLighting.svg', // Replace with your SVG asset path

                    ),
                    SizedBox(width: 8),
                Text(
                  'Ambient Mode',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )]),
                Switch(
                  value: isAmbientModeOn,
                  onChanged: (value) {
                    setState(() {
                      isAmbientModeOn = value;
                    });
                  },
                  activeColor: Colors.white,
                  activeTrackColor: Colors.blue,
                  inactiveTrackColor: Colors.grey,
                  inactiveThumbColor: Colors.white,
                ),
              ],
            ),
            Text(
              'Set interiors to custom lighting.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Slider(
              value: brightnessLevel,
              onChanged: (value) {
                setState(() {
                  brightnessLevel = value;
                });
              },
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
              thumbColor: Colors.white,
            ),
            Center(child:
            TextButton(
              style:ButtonStyle(
                  foregroundColor: WidgetStateProperty.all<Color>(
                    Colors.black, // Use WidgetStateProperty for the color
                  ),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Border radius
                    side: BorderSide(color: Colors.grey), // Border color and width
                  ),
                ),
                padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(horizontal: 8.0), // Padding inside the button
                ),
              ),
              onPressed: widget.onCustomizePressed, // Access the callback from the widget
              child: Text('Customize'),
            )),
          ],
        ),
      ),
    );
  }
}



class MusicModeWidget extends StatefulWidget {
  final VoidCallback onCustomizePressed2;
  MusicModeWidget({Key? key, required this.onCustomizePressed2}) : super(key: key);

  @override
  _MusicModeWidgetState createState() => _MusicModeWidgetState();
}

class _MusicModeWidgetState extends State<MusicModeWidget> {
  bool isMusicModeOn = false;
  double brightnessLevel = 0.5;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 31, top: 8.0, right: 36.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/musicLighting.svg', // Replace with your SVG asset path

                    ),
                    SizedBox(width: 8),
                Text(
                  'Music Mode',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )]),
                Switch(
                  value: isMusicModeOn,
                  onChanged: (value) {
                    setState(() {
                      isMusicModeOn = value;
                    });
                  },
                  activeColor: Colors.white,
                  activeTrackColor: Colors.blue,
                  inactiveTrackColor: Colors.grey,
                  inactiveThumbColor: Colors.white,
                ),
              ],
            ),
            Text(
              'Use music-based lighting.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Slider(
              value: brightnessLevel,
              onChanged: (value) {
                setState(() {
                  brightnessLevel = value;
                });
              },
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
              thumbColor: Colors.white,
            ),
            Center(child:
            TextButton(
              style:ButtonStyle(
                foregroundColor: WidgetStateProperty.all<Color>(
                  Colors.black, // Use WidgetStateProperty for the color
                ),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Border radius
                    side: BorderSide(color: Colors.grey), // Border color and width
                  ),
                ),
                padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(horizontal: 8.0), // Padding inside the button
                ),
              ),
              onPressed: widget.onCustomizePressed2, // Access the callback from the widget
              child: Text('Customize'),
            )),
          ],
        ),
      ),
    );
  }
}



class WeatherModeWidget extends StatefulWidget {
  @override
  _WeatherModeWidgetState createState() => _WeatherModeWidgetState();
}

class _WeatherModeWidgetState extends State<WeatherModeWidget> {
  bool isWeatherModeOn = false;
  double brightnessLevel = 0.5;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 31, top: 8.0, right: 36.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/weatherLighting.svg', // Replace with your SVG asset path

                    ),
                    SizedBox(width: 8),
                Text(
                  'Weather Mode',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )]),
                Switch(
                  value: isWeatherModeOn,
                  onChanged: (value) {
                    setState(() {
                      isWeatherModeOn = value;
                    });
                  },
                  activeColor: Colors.white,
                  activeTrackColor: Colors.blue,
                  inactiveTrackColor: Colors.grey,
                  inactiveThumbColor: Colors.white,
                ),
              ],
            ),
            Text(
              'Use music-based lighting.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Slider(
              value: brightnessLevel,
              onChanged: (value) {
                setState(() {
                  brightnessLevel = value;
                });
              },
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
              thumbColor: Colors.white,
            ),

          ],
        ),
      ),
    );
  }
}
















class SectionWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Center(
        child: Text(
          'Widget 1',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}

class SectionWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Center(
        child: Text(
          'Widget 2',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}

class SectionWidget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Center(
        child: Text(
          'Widget 3',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}