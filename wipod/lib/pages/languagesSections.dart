import 'package:flutter/material.dart';


// Widget for Download Language Pack
class DownloadLanguagePack extends StatelessWidget {
  final List<String> downloadedLanguages;
  final List<String> availableLanguages;
  final Function(String) onLanguageAdded;
  final Function(String) onLanguageDeleted;

  DownloadLanguagePack({
    required this.downloadedLanguages,
    required this.availableLanguages,
    required this.onLanguageAdded,
    required this.onLanguageDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Padding(
        padding: const EdgeInsets.only(left: 31, top: 8.0, right: 36.0, bottom: 0.0),
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row( mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
        Text('Download language pack', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  String? selectedLanguage;
                  return AlertDialog(
                    title: Text('Download Language Pack'),
                    content: DropdownButton<String>(
                      hint: Text("Select Language"),
                      value: selectedLanguage,
                      items: availableLanguages.map((String language) {
                        return DropdownMenuItem<String>(
                          value: language,
                          child: Text(language),
                        );
                      }).toList(),
                      onChanged: (value) {
                        selectedLanguage = value;
                      },
                    ),
                    actions: [
                      TextButton(
                        child: Text('Download'),
                        onPressed: () {
                          if (selectedLanguage != null) {
                            onLanguageAdded(selectedLanguage!);
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ]),
        SizedBox(height: 8),
        Column(
          children: downloadedLanguages.isNotEmpty
              ? downloadedLanguages.map((language) {
            return ListTile(
              title: Text(language),
              trailing: language != 'English - India (en-IN)'
                  ? IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => onLanguageDeleted(language),
              )
                  : null, // Disable delete for English
            );
          }).toList()
              : [Text('No downloaded languages')],
        ),

      ],
    )));
  }
}

// Widget for System Language Selector
class SystemLanguageSelector extends StatelessWidget {
  final String systemLanguage;
  final List<String> downloadedLanguages;
  final Function(String) onLanguageChanged;

  SystemLanguageSelector({
    required this.systemLanguage,
    required this.downloadedLanguages,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

        color: Colors.white,
        child: Padding(
        padding: const EdgeInsets.only(left: 31, top: 8.0, right: 36.0, bottom: 0.0),
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('System Language', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        SizedBox(height: 8),
        ListTile(
          title: Text(systemLanguage),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // Initially set selectedLanguage to the current system language
                  String selectedLanguage = systemLanguage;

                  return StatefulBuilder(
                    builder: (context, setState) {
                      return AlertDialog(
                        title: Text('Set System Language'),
                        content: DropdownButton<String>(
                          value: selectedLanguage,
                          items: downloadedLanguages.map((String language) {
                            return DropdownMenuItem<String>(
                              value: language,
                              child: Text(language),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                selectedLanguage = value;  // Update the selected language
                              });
                            }
                          },
                        ),
                        actions: [
                          TextButton(
                            child: Text('Set'),
                            onPressed: () {
                              onLanguageChanged(selectedLanguage);  // Pass the selected language
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    )));
  }
}
