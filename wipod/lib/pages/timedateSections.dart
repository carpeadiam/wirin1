import 'package:flutter/material.dart';

class TimeDateSection extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? value;
  final bool? switchValue;
  final VoidCallback? onTap;
  final Function(bool)? onSwitchToggle;
  final Widget? additionalWidget;

  TimeDateSection({
    required this.title,
    this.subtitle,
    this.value,
    this.switchValue,
    this.onTap,
    this.onSwitchToggle,
    this.additionalWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left:30,top:3.0,right:30,bottom:3.0),
      decoration: BoxDecoration(
        color: Colors.white,


      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    if (subtitle != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          subtitle!,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                  ],
                ),
              ),
              if (onSwitchToggle != null)
                Switch(
                  value: switchValue!,
                  onChanged: onSwitchToggle,
                  activeColor: Colors.white,
                  activeTrackColor: Colors.blue,
                  inactiveTrackColor: Colors.grey,
                  inactiveThumbColor: Colors.white,
                )
              else if (onTap != null)
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: onTap,
                ),
            ],
          ),
          if (value != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: GestureDetector(
                onTap: onTap,
                child: Text(
                  value!,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          if (additionalWidget != null) additionalWidget!,
        ],
      ),
    );
  }
}

class TimeField extends StatelessWidget {
  final String value;

  TimeField({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}

class FormatPicker extends StatelessWidget {
  final String title;
  final List<String> options;
  final Function(String) onSelected;

  FormatPicker({required this.title, required this.options, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Divider(),
        ListView.builder(
          shrinkWrap: true,
          itemCount: options.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(options[index]),
              onTap: () {
                onSelected(options[index]);
                Navigator.pop(context, options[index]);
              },
            );
          },
        ),
      ],
    );
  }
}
