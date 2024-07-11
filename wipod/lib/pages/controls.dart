
import 'package:flutter/material.dart';

class ControlsPage extends StatelessWidget {



  ControlsPage();
@override
Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: Text('Wipod',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
        )),
    backgroundColor: Colors.white,
    elevation: 0.1,
    centerTitle: true,
  ),


body: Center(
child: Text('This is the Controls Page'),
),
);
}
}
