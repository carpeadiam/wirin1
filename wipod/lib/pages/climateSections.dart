import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

double _currentTemperature = 23;



class CarSeatHeatingControl extends StatefulWidget {
  @override
  _CarSeatHeatingControlState createState() => _CarSeatHeatingControlState();
}

class _CarSeatHeatingControlState extends State<CarSeatHeatingControl> {
  List<int> seatHeatingLevels = [0, 1, 0, 0];
  // add one more state for one more seat
  int selectedSeatIndex = -1;

  final List<String> heatingStateSvgs = [
    'assets/images/heat_0.svg',
    'assets/images/heat_1.svg',
    'assets/images/heat_2.svg',
    'assets/images/heat_3.svg'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(height:800, color: Colors.white, child:Padding(
        padding: const EdgeInsets.only(left:31,top:8.0,right:36.0,bottom:0.0),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top:8.0,left:32,right:32,bottom:8),
          child: Row( mainAxisAlignment: MainAxisAlignment.center,
          children: [ SvgPicture.asset(
            'assets/images/currentTemp.svg', // Replace with your SVG asset path

          ), SizedBox(width:10),

            RichText(
                text: TextSpan(
                  children: [
                TextSpan(
                text: 'Inside: ${_currentTemperature.round()}°C',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                    text: ' Outside: 2°C',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ))]))
    ,
        ])),
    Padding(
    padding: const EdgeInsets.all(16.0),
    child:
        Stack(
          children: [

    ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child:Image.asset('assets/images/carinterior.jpg',height:700)), // Placeholder for the car interior image
            ...List.generate(4, (index) => _buildSeatButton(index)),
            // change to 5 for 5 seats
            if (selectedSeatIndex != -1) _buildControlPanel(),
          ],
        )),
      ],
    )));
  }

  Widget _buildSeatButton(int index) {
    final seatPositions = [
      Offset(65, 250),
      Offset(265, 250),
      Offset(65, 485),
      //Offset(165, 485),
      Offset(265, 485)
    ];

    return Positioned(
      left: seatPositions[index].dx,
      top: seatPositions[index].dy,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedSeatIndex = index;
          });
        },
        child: SvgPicture.asset(
          heatingStateSvgs[seatHeatingLevels[index]],
          width: 50,
          height: 50,
        ),
      ),
    );
  }

  Widget _buildControlPanel() {
    final seatPositions = [
      Offset(20, 220),
      Offset(220, 220),
      Offset(20, 465),
      //Offset(165, 485),
      Offset(220, 465)
    ];

    return Positioned(
      left: seatPositions[selectedSeatIndex].dx,
      top: seatPositions[selectedSeatIndex].dy - 60,
      child: Container(
        color: Colors.black87,
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            TextButton(
              onPressed: () {
                setState(() {

                  seatHeatingLevels[selectedSeatIndex] = 2;
                  selectedSeatIndex = -1;
                });
              },
              child: Text('Auto',style: TextStyle(color:Colors.white)),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  seatHeatingLevels[selectedSeatIndex] =
                      (seatHeatingLevels[selectedSeatIndex] + 1) % 4;
                  // nothing to do with seat number
                });
              },
              child: Text('Heat',style: TextStyle(color:Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class TemperatureSliderControl extends StatefulWidget {
  @override
  _TemperatureSliderControlState createState() =>
      _TemperatureSliderControlState();
}

class _TemperatureSliderControlState extends State<TemperatureSliderControl> {


  @override
  Widget build(BuildContext context) {
    return Container(height:150, color: Colors.white, child:Padding(
        padding: const EdgeInsets.only(left:31,top:8.0,right:36.0,bottom:0.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    SvgPicture.asset(
    'assets/images/currentTemp.svg', // Replace with your SVG asset path
    ),
    SizedBox(width: 8),
      Text(
            'Temperature',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Set the temperature in the vehicle',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        TemperatureSlider(),

      ],
    )));
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

class TemperatureSlider extends StatefulWidget {
  @override
  _TemperatureSliderState createState() => _TemperatureSliderState();
}

class _TemperatureSliderState extends State<TemperatureSlider> {


  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 4.0,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
        thumbColor: Colors.white,
        overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
        overlayColor: Colors.white.withOpacity(0.1),
        activeTrackColor: Colors.grey,
        inactiveTrackColor: Colors.white12,
      ),
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: [Colors.blue,Colors.red],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(bounds);
        },
        blendMode: BlendMode.srcATop,
        child: Slider(
          value: _currentTemperature,
          min: 15,
          max: 30,
          divisions: 15,
          label: _currentTemperature.round().toString(),
          onChanged: (value) {
            setState(() {
              _currentTemperature = value;
            });
          },
        ),
      ),
    );
  }
}

class ClimateControlButtons extends StatefulWidget {
  @override
  _ClimateControlButtonsState createState() => _ClimateControlButtonsState();
}

class _ClimateControlButtonsState extends State<ClimateControlButtons> {
  int _selectedIndex = 0;

  final List<String> _buttonLabels = ['Off', 'Keep', 'Pet', 'Camp', 'Defrost'];
  final List<String> _activeIcons = [
    'assets/images/off_active.svg',
    'assets/images/keep_active.svg',
    'assets/images/pet_active.svg',
    'assets/images/camp_active.svg',
    'assets/images/defrost_active.svg',
  ];
  final List<String> _inactiveIcons = [
    'assets/images/off_inactive.svg',
    'assets/images/keep_inactive.svg',
    'assets/images/pet_inactive.svg',
    'assets/images/camp_inactive.svg',
    'assets/images/defrost_inactive.svg',
  ];

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(height:85, color: Colors.white, child:
      Padding( padding: const EdgeInsets.all(8.0),
      child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(_buttonLabels.length, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () => _onButtonPressed(index),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: _selectedIndex == index ? Colors.blue : Colors.white,
                  borderRadius: index == 0
                      ? BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  )
                      : index == _buttonLabels.length - 1
                      ? BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  )
                      : BorderRadius.zero,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      _selectedIndex == index
                          ? _activeIcons[index]
                          : _inactiveIcons[index],
                      height: 20,
                      width: 20,
                      color: _selectedIndex == index
                          ? Colors.white
                          : Colors.black,
                    ),
                    SizedBox(height: 4),
                    Text(
                      _buttonLabels[index],
                      style: TextStyle(
                        color: _selectedIndex == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    )
    ));
  }
}