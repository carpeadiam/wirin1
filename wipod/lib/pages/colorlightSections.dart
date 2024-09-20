import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerWidget extends StatefulWidget {
  @override
  _ColorPickerWidgetState createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  // Define initial color
  Color selectedColor = Colors.red;

  // List of recommended themes
  List<Color> recommendedThemes = [
    Colors.teal,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    // Extract RGB values from the selected color
    int red = selectedColor.red;
    int green = selectedColor.green;
    int blue = selectedColor.blue;

    return Container(
      height: 650, // Adjusted height to accommodate all widgets
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 31, top: 8.0, right: 36.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Color Picker Wheel directly on the widget
            ColorPicker(
              pickerColor: selectedColor,
              onColorChanged: (Color color) {
                setState(() {
                  selectedColor = color;
                });
              },
              pickerAreaHeightPercent: 0.8, // Adjust the size of the picker area
              enableAlpha: false, // Disable alpha slider
              displayThumbColor: true,
              showLabel: false, // Hide the color label
              paletteType: PaletteType.hsvWithHue, // Use HSV with Hue for color wheel
            ),
            SizedBox(height: 8),
            // RGB values display
            Center( child:
            Text(
              'R: $red   G: $green   B: $blue',
              style: TextStyle(fontSize: 16),
            )),
            SizedBox(height: 25),
            // Recommended themes
            Text(
              'Recommended Themes',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: recommendedThemes.map((color) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColor = color;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: color,
                    radius: 16,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            // Apply button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement apply logic
                },
                child: Text('Apply'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Background color
                  foregroundColor: Colors.white, // Text color
                  side: BorderSide(color: Colors.black38, width: 0.5), // Border color and width
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Border radius
                  ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
