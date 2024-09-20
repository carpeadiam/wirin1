
import 'package:flutter/material.dart';
import 'package:wipod/pages/settingsSections.dart';
import 'package:wipod/pages/section.dart';


class SettingsPage extends StatelessWidget {




  final List<Widget> sections = [
    ProfileHeader(),
    SectionLine(),
TimeAndDateWidget(),
    SectionLine(),
    SyncWithWipodWidget(),
    SectionLine(),
    NotificationsWidget(),
    SectionLine(),
    LanguagesWidget(),
    SectionLine(),
    SecurityWidget(),
    SectionLine(),
    ThemeWidgetSettings(),
  ];


  SettingsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title: Text('Settings',style: TextStyle(color:Colors.black,fontFamily: 'Poppins',
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
