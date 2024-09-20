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


class ThemeWidget extends StatelessWidget {

  Color ambientColor = Colors.pink; // set to ambient color

  final VoidCallback onColorPressed;

  ThemeWidget({Key? key, required this.onColorPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 31, top: 8.0, right: 30.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Center( child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            Text(
              'Play with colors for true customization',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ), SizedBox(width:2),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Make the button circular
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.color_lens, color: ambientColor),
                    onPressed: onColorPressed,
                  ),
                )
              ])),

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
          'Play around with colors to achieve true customization',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        )),
      );
  }
}