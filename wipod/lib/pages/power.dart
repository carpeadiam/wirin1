
import 'package:flutter/material.dart';
import 'package:wipod/pages/powerSections.dart';
import 'package:wipod/pages/section.dart';


class PowerPage extends StatelessWidget {


  final VoidCallback onBackButtonPressed;

  final List<Widget> sections = [
    CurrentlyCharging(),
    SectionLine(),
    ChargeLimitWidget(),
    SectionLine(),
    ScheduledChargingWidget(),
    SectionLine(),
    ChargingHistoryWidget(),
  ];


  PowerPage({required this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
            title: Text('Power',style: TextStyle(color:Colors.black,fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,),),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: onBackButtonPressed,
            ),
        backgroundColor: Colors.white,
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
