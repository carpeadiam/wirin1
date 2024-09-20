import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fl_chart/fl_chart.dart';



class CurrentlyCharging extends StatelessWidget {

  final String currentCharge = "225km";
  final int percentage =85;
  final String chargeRate = "59 km/hr";
  final String timeToFull = "25 min to full";
  // use functions to initalise

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: Colors.white,
      child: Column(
      children:<Widget>[ Container(
        margin: EdgeInsets.only(left:32,top:32.0,right:32.0,bottom:0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,

        children: <Widget>[
          Container( child:
      SvgPicture.asset("assets/images/currentlycharging.svg")

          ),
          SizedBox(width: 10), // Add some space between the icon and the text
          Text(
            'Current Charge',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$currentCharge, ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: '$percentage%',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 4),
          Container(
            child: SvgPicture.asset(
            percentage >= 80
                ? 'assets/images/battery80.svg'
                : percentage >= 60
                ? 'assets/images/battery60.svg'
                : percentage >= 40
                ? 'assets/images/battery40.svg'
                : percentage >= 20
                ? 'assets/images/battery20.svg'
                : 'assets/images/battery20.svg',

          )),
        ],



      )),
    Container(
    margin: EdgeInsets.only(left:32,top:8.0,right:36.0,bottom:0.0),
    child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '$chargeRate',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(width: 8),
            Text(
              '$timeToFull',
              style: TextStyle(fontSize: 16, color: Colors.blueGrey),
            ),
          ],
        ),

    )
      ])
    );
  }
}

class ChargeLimitWidget extends StatefulWidget {
  @override
  _ChargeLimitWidgetState createState() => _ChargeLimitWidgetState();
}

class _ChargeLimitWidgetState extends State<ChargeLimitWidget> {
  double _chargeLimit = 95;

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
                'assets/images/maxchargelimit.svg', // Replace with your SVG asset path

              ),
              SizedBox(width: 8),
              Text(
                'Charge Limit',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                '${_chargeLimit.toInt()}%',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 16),
          Slider(
            value: _chargeLimit,
            onChanged: (newLimit) {
              setState(() {
                _chargeLimit = newLimit;
              });
            },
            min: 0,
            max: 100,
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
            thumbColor: Colors.white,

          ),
          Center(
          child:Text(
            'Defined the max your battery charges to.',
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          )),
        ],
      ),
    ));
  }
}


class ScheduledChargingWidget extends StatefulWidget {
  @override
  _ScheduledChargingWidgetState createState() =>
      _ScheduledChargingWidgetState();
}

class _ScheduledChargingWidgetState extends State<ScheduledChargingWidget> {
  TimeOfDay _selectedTime = TimeOfDay(hour: 8, minute: 30);
  List<bool> _selectedDays = [true, true, true, true, true, false, false];

  // Selected Days must be bool in terms of MTWTFSS

  void _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(height:220, color: Colors.white, child:Padding(
      padding: const EdgeInsets.only(left:31,top:8.0,right:36.0,bottom:0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/scheduledcharging.svg', // Replace with your SVG asset path
              ),
              SizedBox(width: 8),
              Text(
                'Scheduled Charging',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/departuretime.svg', // Replace with your SVG asset path

              ),
              SizedBox(width: 8),
              Text(
                'Departure Time',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: _pickTime,
                child: Text('${_selectedTime.format(context)}'),
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
          SizedBox(height: 8),
          Text(
            'Your car will reach the charge limit by this time on the selected days.',
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          ),
          SizedBox(height: 16),
      Padding(
        padding: const EdgeInsets.only(left:30,top:3.0,right:30,bottom:3.0),
        child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) {
              String day = 'MTWTFSS'[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDays[index] = !_selectedDays[index];
                  });
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor:
                  _selectedDays[index] ? Colors.blue : Colors.blueGrey[200],
                  child: Text(
                    day,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }),
          )),
        ],
      ),
    ));
  }
}

class ChargingHistoryWidget extends StatefulWidget {
  @override
  _ChargingHistoryWidgetState createState() => _ChargingHistoryWidgetState();
}

class _ChargingHistoryWidgetState extends State<ChargingHistoryWidget> {
  bool showLast24Hours = true;

  final List<List<double>> last24HoursData = [
    [20, 0],
    [30, 1],
    [40, 1],
    [60, 1],
    [80, 1],
    [90, 0],
    [95, 0],
    [90, 0],
    [80, 1],
    [70, 1],
    [60, 1],
    [50, 1],
    [40, 1],
    [30, 1],
    [20, 1],
    [10, 0],
    [20, 1],
    [30, 1],
    [40, 1],
    [50, 0],
    [60, 0],
    [70, 0],
    [80, 0],
    [90, 0],
  ];

  final List<List<double>> last10DaysData = [
    [90, 20, 5],
    [85, 30, 4],
    [80, 25, 6],
    [75, 20, 7],
    [70, 30, 5],
    [95, 40, 6],
    [90, 35, 7],
    [85, 25, 8],
    [80, 30, 6],
    [75, 20, 5],
  ];

  void toggleView() {
    setState(() {
      showLast24Hours = !showLast24Hours;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        color: Colors.white,
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
        margin: EdgeInsets.only(left:32,top:32.0,right:32.0,bottom:0.0),
      child:
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Charging History',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        )),
        SizedBox(height: 25),


        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: toggleView,
              style: ElevatedButton.styleFrom(
                backgroundColor: showLast24Hours ? Colors.blue : Colors.white,
                foregroundColor: showLast24Hours ? Colors.white : Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(10)), // Rounded left side
                ),
              ),
              child: Text('Last 24 Hours'),
            ),
            ElevatedButton(
              onPressed: toggleView,
              style: ElevatedButton.styleFrom(
                backgroundColor: !showLast24Hours ? Colors.blue : Colors.white,
                foregroundColor: !showLast24Hours ? Colors.white : Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(right: Radius.circular(10)), // Rounded left side
                ),
              ),
              child: Text('Last 10 Days'),
            ),
          ],
        ),
        SizedBox(height: 16),
        AspectRatio(
          aspectRatio: 1.5,
          child: showLast24Hours
              ? BatteryPercentage24HoursChart(data: last24HoursData)
              : BatteryPercentage10DaysChart(data: last10DaysData),

        ),
      ],
    ));
  }
}

class BatteryPercentage24HoursChart extends StatelessWidget {
  final List<List<double>> data;

  BatteryPercentage24HoursChart({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:32.0,left:32,right:32,bottom:10),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.center,
          maxY: 100,
          groupsSpace:6,
          gridData: FlGridData(show: true, drawVerticalLine: false),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {

                  return value%4==0 || value == 23?Text('${value.toInt()}h'):Text("");
                },
              ),
            ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {

                    return Text('${value.toInt()}%',style: TextStyle(
                    color: Colors.black38, // Bottom axis title color// Bottom axis title weight
                      fontSize: 8, // Bottom axis title size
                    ),);
                  },
                ),
              ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),

          borderData: FlBorderData(show: true, border:  Border(
            left: BorderSide.none,
            top: BorderSide.none,
            right: BorderSide(color: Colors.black38, width: 0.5), // Right border
            bottom: BorderSide(color: Colors.black38, width: 0.5), // Bottom border
          ), ),
          barGroups: data.asMap().entries.map((entry) {
            double percentage = entry.value[0];
            bool isCharging = entry.value[1] == 1;
            Color barColor;

            if (isCharging) {
              barColor = Colors.blue;
            } else if (percentage > 60) {
              barColor = Colors.green;
            } else if (percentage > 20) {
              barColor = Colors.yellow;
            } else {
              barColor = Colors.red;
            }

            return BarChartGroupData(
              x: entry.key,
              barRods: [
                BarChartRodData(
                  toY: percentage,
                  color: barColor,
                  width: 5,

                ),
              ],
             // showingTooltipIndicators: [0],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class BatteryPercentage10DaysChart extends StatelessWidget {
  final List<List<double>> data;

  BatteryPercentage10DaysChart({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:32.0,left:32,right:32,bottom:10),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.center,
          maxY: 100,
          groupsSpace:15,
          gridData: FlGridData(show: true, drawVerticalLine: false),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true,
                getTitlesWidget: (value, meta) {

                  return Text('${value.toInt()+1}d',style: TextStyle(
                  ),);
                },),


            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {

                  return Text('${value.toInt()}%',style: TextStyle(
                    color: Colors.black38, // Bottom axis title color// Bottom axis title weight
                    fontSize: 8, // Bottom axis title size
                  ),);
                },
              ),
            ),

          ),
          borderData: FlBorderData(show: true, border:  Border(
            left: BorderSide.none,
            top: BorderSide.none,
            right: BorderSide(color: Colors.black38, width: 0.5), // Right border
            bottom: BorderSide(color: Colors.black38, width: 0.5), // Bottom border
          ),),
          barGroups: data
              .asMap()
              .entries
              .map(
                (entry) => BarChartGroupData(
              x: entry.key,
              barRods: [
                BarChartRodData(
                  toY: entry.value[0],
                  color: Colors.green,
                  width: 5,
                ),
                BarChartRodData(
                  toY: entry.value[1],
                  color: Colors.yellow,
                  width: 5,
                ),
              ],
              showingTooltipIndicators: [2],
            ),

          )
              .toList(),
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                // Use groupIndex to access the correct entry
                final value = data[groupIndex][2]; // Get the third element
                return BarTooltipItem(
                  '$value hr charged',
                  TextStyle(color: Colors.white, fontSize: 10),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}