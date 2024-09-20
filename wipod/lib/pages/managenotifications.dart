
import 'package:flutter/material.dart';
import 'package:wipod/pages/managenotificationsSections.dart';
import 'package:wipod/pages/section.dart';


class ManageNotificationsPage extends StatelessWidget {




  final List<Widget> sections = [

    AppManagementWidget(),
  ];


  ManageNotificationsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title: Text('App Notifications',style: TextStyle(color:Colors.black,fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,),),
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
