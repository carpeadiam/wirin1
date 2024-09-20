import 'package:flutter/material.dart';
import 'package:wipod/pages/managenotifications.dart';

class AppNotificationsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ManageNotificationsPage()),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'App notifications',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              'Control notifications from individual apps',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class PrivacyModeWidget extends StatefulWidget {
  @override
  _PrivacyModeWidgetState createState() => _PrivacyModeWidgetState();
}

class _PrivacyModeWidgetState extends State<PrivacyModeWidget> {
  bool isPrivacyModeOn = true; // Initial state

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Mode',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Turn off display of notifications from social media',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          Switch(
            value: isPrivacyModeOn,
            onChanged: (bool value) {
              setState(() {
                isPrivacyModeOn = value;
              });
              // Handle switch toggle logic
            },
            activeColor: Colors.white,
            activeTrackColor: Colors.blue,
            inactiveTrackColor: Colors.grey,
            inactiveThumbColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

class DoNotDisturbWidget extends StatefulWidget {
  @override
  _DoNotDisturbWidgetState createState() => _DoNotDisturbWidgetState();
}

class _DoNotDisturbWidgetState extends State<DoNotDisturbWidget> {
  bool isDoNotDisturbOn = false; // Initial state

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Do not Disturb',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Turn off display of all notifications',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          Switch(
            value: isDoNotDisturbOn,
            onChanged: (bool value) {
              setState(() {
                isDoNotDisturbOn = value;
              });
              // Handle switch toggle logic
            },
            activeColor: Colors.white,
            activeTrackColor: Colors.blue,
            inactiveTrackColor: Colors.grey,
            inactiveThumbColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
