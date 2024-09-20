import 'package:flutter/material.dart';


class BrightnessWidget extends StatefulWidget {
  @override
  _BrightnessWidgetState createState() => _BrightnessWidgetState();
}

class _BrightnessWidgetState extends State<BrightnessWidget> {
  double brightnessLevel = 0.5; // Initial brightness level

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 31, top: 8.0, right: 36.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Brightness',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.brightness_low, color: Colors.grey, size:16),
                Expanded(
                  child: Slider(
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
                ),
                Icon(Icons.brightness_high, color: Colors.grey, size:16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class SyncSpotifyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 31, top: 8.0, right: 36.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sync with Spotify',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Connect your Spotify Account',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Center(
              child:
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // Logic for connecting with Spotify goes here
              },
              child: Text(
                'Connect with Spotify',
                style: TextStyle(color: Colors.white),
              ),
            )),
          ],
        ),
      ),
    );
  }
}


class SyncAppleMusicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 31, top: 8.0, right: 36.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sync with Apple Music',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Connect your Apple Music Account',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 8),
        Center(
          child:
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // Logic for connecting with Apple Music goes here
              },
              child: Text(
                'Connect with Apple Music',
                style: TextStyle(color: Colors.white),
              ),
            )),
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
      height: 50,
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.only(left:31,top:8.0,right:36.0,bottom:0.0),
          child: Text(
            'Use music based lighting.',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          )),
    );
  }
}