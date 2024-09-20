
import 'package:flutter/material.dart';
import 'package:wipod/pages/languagesSections.dart';
import 'package:wipod/pages/section.dart';


class LanguagesPage extends StatefulWidget {
  @override
  _LanguagesPageState createState() => _LanguagesPageState();
}

class _LanguagesPageState extends State<LanguagesPage> {
  List<String> downloadedLanguages = ['English - India (en-IN)', 'Kannada (kn)'];
  List<String> availableLanguages = ['Hindi (hi)', 'Tamil (ta)', 'Telugu (te)'];
  String systemLanguage = 'English - India (en-IN)';

  void addLanguage(String language) {
    setState(() {
      downloadedLanguages.add(language);
      availableLanguages.remove(language);
    });
  }

  void deleteLanguage(String language) {
    setState(() {
      if (language == systemLanguage) {
        systemLanguage = 'English - India (en-IN)';
      }
      downloadedLanguages.remove(language);
      availableLanguages.add(language);
    });
  }

  void changeSystemLanguage(String language) {
    setState(() {
      systemLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Languages',style: TextStyle(color:Colors.black,fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,),),
          backgroundColor: Colors.white,
          shadowColor: Colors.black, surfaceTintColor: Colors.white),
      body: Column(
        children: [
          SystemLanguageSelector(
            systemLanguage: systemLanguage,
            downloadedLanguages: downloadedLanguages,
            onLanguageChanged: changeSystemLanguage,
          ),
          SectionLine(),
          DownloadLanguagePack(
            downloadedLanguages: downloadedLanguages,
            availableLanguages: availableLanguages,
            onLanguageAdded: addLanguage,
            onLanguageDeleted: deleteLanguage,
          ),
        ],
      ),
    );
  }
}
