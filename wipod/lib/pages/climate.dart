
import 'package:flutter/material.dart';
import 'package:wipod/pages/climateSections.dart';
import 'package:wipod/pages/section.dart';


class ClimatePage extends StatelessWidget {

  final List<Widget> sections = [
    CarSeatHeatingControl(),
    ClimateControlButtons(),
    SectionLine(),
    TemperatureSliderControl(),

  ];

  final VoidCallback onBackButtonPressed;

  ClimatePage({required this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
        title: Text('Climate',style: TextStyle(color:Colors.black,fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,),),
    leading: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: onBackButtonPressed,
    ) , backgroundColor: Colors.white,
            shadowColor: Colors.black, surfaceTintColor: Colors.white),

      body: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index){
          return sections[index];
        },
      ),
    );
  }
}
