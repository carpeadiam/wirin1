import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CarStatusWidget extends StatefulWidget {
  @override
  _CarStatusWidgetState createState() => _CarStatusWidgetState();
}

class _CarStatusWidgetState extends State<CarStatusWidget> {
  // Variables stored within the widget itself
  int batteryPercentage = 85;
  bool isCharging = true;
  int chargeTime = 41;
  int remainingKm = 204;
  double avgConsumption = 128.0;
  bool isConnected = false;
  bool isLoading = true; // Variable to track loading status

  @override
  void initState() {
    super.initState();
    // Simulate loading data with a delay of 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        isLoading = false; // Data has finished loading
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      color: Colors.white,
      child: isLoading
          ? Center(
        child: CircularProgressIndicator(), // Display loading animation
      )
          : Column(
        children: [
          // Centered Row containing Car Image, SizedBox, Battery Stats, and Battery Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildCarImage(),
              SizedBox(width: 15),
              buildBatteryAndStats(),
            ],
          ),
          SizedBox(height: 24),
          // Centered Row containing Connect and Charging Info
          buildConnectAndChargingInfo(),
        ],
      ),
    );
  }

  // Car Image Widget
  Widget buildCarImage() {
    return Image.asset(
      'assets/images/wipodcar1.png', // Replace with your image path
      height: 120,
      fit: BoxFit.cover,
    );
  }

  // Battery and Stats Combined Widget
  Widget buildBatteryAndStats() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBatteryDetail('$remainingKm km', 'Remaining'),
            SizedBox(height: 12),
            buildBatteryDetail('$avgConsumption Wh/km', 'Average'),
            SizedBox(height: 12),
            buildBatteryDetail('$batteryPercentage%', 'Battery'),
          ],
        ),
        SizedBox(width: 16),
        buildBatteryBar(),
      ],
    );
  }

  // Individual Battery Detail Widget
  Widget buildBatteryDetail(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  // Battery Bar Widget
  Widget buildBatteryBar() {
    return Container(
      width: 15,
      height: 180,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]!),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Empty bar background
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          // Filled bar representing battery percentage
          Container(
            height: 180 * (batteryPercentage / 100),
            decoration: BoxDecoration(
              color: batteryPercentage > 20 ? Colors.green : Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Connect and Charging Info Widget
  Widget buildConnectAndChargingInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Connect Status as Button
        ElevatedButton(
          onPressed: isConnected
              ? null
              : () async {
            await Future.delayed(Duration(seconds: 3)); // Simulate connection delay
            setState(() {
              isConnected = true; // Set to connected state
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: isConnected ? Colors.green : Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            side: BorderSide(color: Colors.black38, width: 0.5), // Border color and width
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Border radius
            ),
          ),
          child: Row(
            children: [
              Icon(
                isConnected ? Icons.check_circle : Icons.wifi_off,
                color: Colors.white,
                size: 16,
              ),
              SizedBox(width: 8),
              Text(
                isConnected ? 'Connected' : 'Connect',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 16),
        // Charging Status
        Row(
          children: [
            Icon(
              isCharging ? Icons.bolt : Icons.power_off,
              color: isCharging ? Colors.orange : Colors.red,
              size: 16,
            ),
            SizedBox(width: 8),
            Text(
              isCharging ? 'Charging - $chargeTime min left' : 'Not Charging',
              style: TextStyle(
                fontSize: 16,
                color: isCharging ? Colors.orange : Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FrunkAndTrunkControls extends StatefulWidget {
  @override
  _FrunkAndTrunkControlsState createState() => _FrunkAndTrunkControlsState();
}

class _FrunkAndTrunkControlsState extends State<FrunkAndTrunkControls> {
  bool isFrunkOpen = false;
  bool isTrunkOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 31, top: 8.0, right: 36.0, bottom: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
        SvgPicture.asset(
          'assets/images/trunk.svg', // Replace with your SVG asset path

        ),
                    Text('Left Door'),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isFrunkOpen = !isFrunkOpen;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isFrunkOpen ? Colors.blue : Colors.white,
                        foregroundColor: isFrunkOpen ? Colors.white : Colors.black,
                        side: BorderSide(color: Colors.black38, width: 0.5), // Border color and width
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)), // Border radius
                      ),
                      child: Text(isFrunkOpen ? 'Open' : 'Closed'),
                    ),
                  ],
                ),
                Column(
                  children: [


                    SvgPicture.asset(
                      'assets/images/trunk.svg', // Replace with your SVG asset path

                    ),
                    Text('Right Door'),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isTrunkOpen = !isTrunkOpen;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: isTrunkOpen ? Colors.blue : Colors.white,
                          foregroundColor: isTrunkOpen ? Colors.white : Colors.black,
                        side: BorderSide(color: Colors.black38, width: 0.5), // Border color and width
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),) // Border radius
                      ),
                      child: Text(isTrunkOpen ? 'Open' : 'Closed'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height:40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Icon(Icons.power_settings_new, size: 30),
                  SizedBox(width:10),
                  Text('Remote Start Car'),]),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Background color
                    foregroundColor: Colors.white, // Text color
                    side: BorderSide(color: Colors.black38, width: 0.5), // Border color and width
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Border radius
                    ),
                  ),
                  child: Text('Start Car'),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}



class RemoteStartAndCarFinderControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 31, top: 2.0, right: 36.0, bottom: 0.0),
        child: Column(
          children: [
            SizedBox(height: 5),
            Text(
              'Need help finding your car?',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Flash'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background color
                    foregroundColor: Colors.black, // Text color
                    side: BorderSide(color: Colors.black38, width: 0.5), // Border color and width
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Border radius
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Honk'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background color
                    foregroundColor: Colors.black, // Text color
                    side: BorderSide(color: Colors.black38, width: 0.5), // Border color and width
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Border radius
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Location'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background color
                    foregroundColor: Colors.black, // Text color
                    side: BorderSide(color: Colors.black38, width: 0.5), // Border color and width
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Border radius
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


