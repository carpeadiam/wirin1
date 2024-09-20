import 'package:flutter/material.dart';
import 'package:wipod/pages/timedateSections.dart';
import 'package:wipod/pages/section.dart';

import 'package:intl/intl.dart';

class TimeDatePage extends StatefulWidget {
  @override
  _TimeDatePageState createState() => _TimeDatePageState();
}

class _TimeDatePageState extends State<TimeDatePage> {
  bool autoTimeZone = true;
  bool autoDate = true;
  bool use24HourFormat = true;

  // Actual values stored separately
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  // Formats for display
  String dateFormat = "dd/MM/yy";  // Default date format
  String timeFormat = "HH:mm";     // Default time format

  String timeZone = "GMT + 05:30 India Standard Time";

  final List<String> timeZones = [
    "Custom Time",
    "GMT + 00:00 Greenwich Mean Time",
    "GMT + 05:30 India Standard Time",
    "GMT + 01:00 Central European Time",
    "GMT - 05:00 Eastern Standard Time",
  ];

  // Function to toggle the timezone setting
  void _toggleAutoTimeZone(bool value) {
    setState(() {
      autoTimeZone = value;
      if (autoTimeZone) {
        timeZone = "GMT + 05:30 India Standard Time";
      } else {
        timeZone = "Custom Time";
      }
    });
  }

  // Function to toggle the date setting
  void _toggleAutoDate(bool value) {
    setState(() {
      autoDate = value;
      if (autoDate) {
        selectedDate = DateTime.now();
      }
    });
  }

  // Function to toggle the time format setting
  void _toggleUse24HourFormat(bool value) {
    setState(() {
      use24HourFormat = value;
      timeFormat = use24HourFormat ? "HH:mm" : "hh:mm a";
    });
  }

  // Function to update the time when editing
  void _updateTime() async {
    if (!autoTimeZone && timeZone == "Custom Time") {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedTime,
      );

      if (pickedTime != null) {
        setState(() {
          selectedTime = pickedTime;
        });
      }
    }
  }

  // Function to update the date when editing
  void _updateDate() async {
    if (!autoDate) {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
      );

      if (pickedDate != null) {
        setState(() {
          selectedDate = pickedDate;
        });
      }
    }
  }

  // Function to update the date format
  void _updateDateFormat(String newFormat) {
    setState(() {
      dateFormat = newFormat;
    });
  }

  // Function to update the time format
  void _updateTimeFormat(String newFormat) {
    setState(() {
      timeFormat = newFormat;
    });
  }

  // Format date without changing the actual value
  String _formatDate(DateTime date) {
    DateFormat formatter = DateFormat(dateFormat);
    return formatter.format(date);
  }

  // Format time without changing the actual value
  String _formatTime(TimeOfDay time) {
    DateTime now = DateTime.now();
    DateTime formattedTime = DateTime(
      now.year, now.month, now.day, time.hour, time.minute,
    );
    DateFormat formatter = DateFormat(timeFormat);
    return formatter.format(formattedTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Time & Date Settings',
          style: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white,
      ),
      body: ListView(
        children: [
          TimeDateSection(
            title: 'Set time zone automatically',
            subtitle: 'Location may be used to set timezone',
            switchValue: autoTimeZone,
            onSwitchToggle: _toggleAutoTimeZone,
            additionalWidget: !autoTimeZone
                ? GestureDetector(
              onTap: () async {
                String? newTimeZone = await showModalBottomSheet<String>(
                  context: context,
                  builder: (BuildContext context) {
                    return FormatPicker(
                      title: 'Select Time Zone',
                      options: timeZones,
                      onSelected: (String selected) {
                        setState(() {
                          timeZone = selected;
                        });
                      },
                    );
                  },
                );
              },
              child: TimeField(value: timeZone),
            )
                : null,
          ),
          SectionLine(),
          TimeDateSection(
            title: 'Time',
            value: _formatTime(selectedTime),
            onTap: !autoTimeZone && timeZone == "Custom Time" ? _updateTime : null,
          ),
          SectionLine(),
          TimeDateSection(
            title: 'Set date automatically',
            subtitle: 'Automatically adjust date based on timezone',
            switchValue: autoDate,
            onSwitchToggle: _toggleAutoDate,
            additionalWidget: !autoDate
                ? GestureDetector(
              onTap: _updateDate,
              child: TimeField(value: _formatDate(selectedDate)),
            )
                : null,
          ),
          SectionLine(),
          TimeDateSection(
            title: 'Date',
            value: _formatDate(selectedDate),
            onTap: !autoDate ? _updateDate : null,
          ),
          SectionLine(),
          TimeDateSection(
            title: 'Use 24-hour time format',
            subtitle: 'Currently enabled',
            switchValue: use24HourFormat,
            onSwitchToggle: _toggleUse24HourFormat,
          ),
          SectionLine(),
          TimeDateSection(
            title: 'Set date format',
            value: dateFormat,
            onTap: () async {
              await showModalBottomSheet<String>(
                context: context,
                builder: (BuildContext context) {
                  return FormatPicker(
                    title: 'Select Date Format',
                    options: ["dd/MM/yy", "MM/dd/yy", "yyyy/MM/dd"],
                    onSelected: _updateDateFormat,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
