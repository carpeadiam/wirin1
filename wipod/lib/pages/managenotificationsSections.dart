import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wipod/pages/section.dart';

class AppManagementWidget extends StatefulWidget {
  @override
  _AppManagementWidgetState createState() => _AppManagementWidgetState();
}

class _AppManagementWidgetState extends State<AppManagementWidget> {
  List<AppItem> allowedApps = [];
  List<AppItem> notAllowedApps = [];
  List<AppItem> remainingApps = [
    AppItem(name: 'Instagram', icon: 'assets/images/instagram.svg'),
    AppItem(name: 'WhatsApp', icon: 'assets/images/whatsapp.svg'),
    AppItem(name: 'Twitter', icon: 'assets/images/twitter.svg'),
  ];

  void addAppToAllowed(AppItem app) {
    setState(() {
      allowedApps.add(app);
      remainingApps.remove(app);
    });
  }

  void addAppToNotAllowed(AppItem app) {
    setState(() {
      notAllowedApps.add(app);
      remainingApps.remove(app);
    });
  }

  void removeAppFromAllowed(AppItem app) {
    setState(() {
      allowedApps.remove(app);
      remainingApps.add(app);
    });
  }

  void removeAppFromNotAllowed(AppItem app) {
    setState(() {
      notAllowedApps.remove(app);
      remainingApps.add(app);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Padding(
        padding: const EdgeInsets.only(left: 31, top: 8.0, right: 36.0, bottom: 0.0),
    child:Column(
      children: [
        AppCategoryWidget(
          title: 'Allowed apps',
          apps: allowedApps,
          onAddApp: addAppToAllowed,
          onRemoveApp: removeAppFromAllowed,
          remainingApps: remainingApps,
        ),
        SectionLine(),
        AppCategoryWidget(
          title: 'Not allowed apps',
          apps: notAllowedApps,
          onAddApp: addAppToNotAllowed,
          onRemoveApp: removeAppFromNotAllowed,
          remainingApps: remainingApps,
        ),
      ],
    )));
  }
}

class AppCategoryWidget extends StatelessWidget {
  final String title;
  final List<AppItem> apps;
  final Function(AppItem) onAddApp;
  final Function(AppItem) onRemoveApp;
  final List<AppItem> remainingApps;

  AppCategoryWidget({
    required this.title,
    required this.apps,
    required this.onAddApp,
    required this.onRemoveApp,
    required this.remainingApps,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      AppItem? selectedApp;
                      return AlertDialog(
                        title: Text('Add App'),
                        content: DropdownButton<AppItem>(
                          hint: Text("Select App"),
                          value: selectedApp,
                          items: remainingApps.map((AppItem app) {
                            return DropdownMenuItem<AppItem>(
                              value: app,
                              child: Row(
                                children: [
                                  SvgPicture.asset(app.icon, width: 24, height: 24),
                                  SizedBox(width: 8),
                                  Text(app.name),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            selectedApp = value;
                          },
                        ),
                        actions: [
                          TextButton(
                            child: Text('Add'),
                            onPressed: () {
                              if (selectedApp != null) {
                                onAddApp(selectedApp!);
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
            ],
          ),
          Column(
            children: apps.map((app) {
              return AppItemWidget(
                app: app,
                onRemove: onRemoveApp,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class AppItemWidget extends StatelessWidget {
  final AppItem app;
  final Function(AppItem) onRemove;

  AppItemWidget({
    required this.app,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(app.icon, width: 32, height: 32),
              SizedBox(width: 16),
              Text(app.name),
            ],
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => onRemove(app),
          ),
        ],
      ),
    );
  }
}

class AppItem {
  final String name;
  final String icon;

  AppItem({required this.name, required this.icon});
}
