
import 'package:flutter/material.dart';
import 'package:wipod/pages/notificationsSections.dart';
import 'package:wipod/pages/section.dart';


class NotificationsPage extends StatelessWidget {




  final List<Widget> sections = [
    AppNotificationsWidget(),
    SectionLine(),
    PrivacyModeWidget(),
    SectionLine(),
    DoNotDisturbWidget(),
  ];


  NotificationsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title: Text('Notifications',style: TextStyle(color:Colors.black,fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,),),
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
