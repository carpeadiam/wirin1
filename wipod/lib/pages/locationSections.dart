import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LocationSearchWidget extends StatefulWidget {
  @override
  _LocationSearchWidgetState createState() => _LocationSearchWidgetState();
}

class _LocationSearchWidgetState extends State<LocationSearchWidget> {
  String location = "Your Location";
  String search = "Search";
  int connectStatus = 1; // 0 for Not Connected, 1 for Connected

  List<String> suggestions = ['Your Location', 'Search', 'Place 1', 'Place 2', 'Place 3'];

  late TextEditingController locationController;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    locationController = TextEditingController(text: location);
    searchController = TextEditingController(text: search);
  }

  @override
  void dispose() {
    locationController.dispose();
    searchController.dispose();
    super.dispose();
  }

  void switchText() {
    setState(() {
      String temp = locationController.text;
      locationController.text = searchController.text;
      searchController.text = temp;
    });
  }

  void resetLocation() {
    setState(() {
      locationController.text = 'Your Location';
    });
  }

  void navigateFunction() {
    // Empty function for navigation
  }

  @override
  Widget build(BuildContext context) {
    return Container(  // Return the Container
      height: 230,
      color: Colors.white,
      child:Padding(
    padding: const EdgeInsets.only(left:31,top:8.0,right:36.0,bottom:0.0),
    child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            children: [

              Column(
                children: [

                  Icon(Icons.location_on, color: Colors.blue),
                  const SizedBox(height: 20),
                  Icon(Icons.location_on, color: Colors.red),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Autocomplete<String>(
                            optionsBuilder: (TextEditingValue textEditingValue) {
                              return suggestions.where((String option) {
                                return option.toLowerCase().contains(
                                    textEditingValue.text.toLowerCase());
                              });
                            },
                            onSelected: (String selection) {
                              setState(() {
                                locationController.text = selection;
                              });
                            },
                            fieldViewBuilder: (BuildContext context,
                                TextEditingController fieldTextEditingController,
                                FocusNode fieldFocusNode,
                                VoidCallback onFieldSubmitted) {
                              return TextFormField(
                                controller: locationController,
                                focusNode: fieldFocusNode,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                onChanged: (value) {
                                  // Update controller value on each text change
                                  locationController.value = TextEditingValue(
                                    text: value,
                                    selection: TextSelection.fromPosition(
                                      TextPosition(offset: value.length),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Autocomplete<String>(
                            optionsBuilder: (TextEditingValue textEditingValue) {
                              return suggestions.where((String option) {
                                return option.toLowerCase().contains(
                                    textEditingValue.text.toLowerCase());
                              });
                            },
                            onSelected: (String selection) {
                              setState(() {
                                searchController.text = selection;
                              });
                            },
                            fieldViewBuilder: (BuildContext context,
                                TextEditingController fieldTextEditingController,
                                FocusNode fieldFocusNode,
                                VoidCallback onFieldSubmitted) {
                              return TextFormField(
                                controller: searchController,
                                focusNode: fieldFocusNode,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                onChanged: (value) {
                                  // Update controller value on each text change
                                  searchController.value = TextEditingValue(
                                    text: value,
                                    selection: TextSelection.fromPosition(
                                      TextPosition(offset: value.length),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: resetLocation,
                  ),
                  const SizedBox(height: 20),
                  IconButton(
                    icon: Icon(Icons.import_export),
                    onPressed: switchText,
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: navigateFunction,
            child: Text("Navigate"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Background color
              foregroundColor: Colors.white, // Text color
              side: BorderSide(color: Colors.black38, width: 0.5), // Border color and width
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Border radius
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            connectStatus == 0 ? "Not Connected" : "Connected to Wipod",
            style: TextStyle(fontSize: 16, color: Colors.black,fontStyle:FontStyle.italic),
          ),
        ],
      ),
    ));
  }
}

class SavedLocationsWidget extends StatefulWidget {
  @override
  _SavedLocationsWidgetState createState() => _SavedLocationsWidgetState();
}

class _SavedLocationsWidgetState extends State<SavedLocationsWidget> {
  List<Map<String, String>> savedLocations = [
    {"label": "Home", "address": "Cauvery Hostel, RV College Of Engineering, Pattanagere, 560059"},
    {"label": "Work", "address": "Amazon Office, WTC, Subramanyanagar, Rajajinagar, Bengaluru, Karnataka 560055"},
    {"label": "Daivik’s", "address": "Amazon Office, WTC, Subramanyanagar, Rajajinagar, Bengaluru, Karnataka 560055"},
  ];

  final List<String> suggestions = [
    "Cauvery Hostel, RV College Of Engineering, Pattanagere, 560059",
    "Amazon Office, WTC, Subramanyanagar, Rajajinagar, Bengaluru, Karnataka 560055",
    // Add more suggestions here
  ];

  void addLocation(String label, String address) {
    setState(() {
      savedLocations.add({"label": label, "address": address});
    });
  }

  void showAddLocationDialog() {
    String newLabel = "";
    String newAddress = "";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Location"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  newLabel = value;
                },
                decoration: InputDecoration(labelText: "Label"),
              ),
              const SizedBox(height: 10),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return suggestions.where((String option) {
                    return option.toLowerCase().contains(
                        textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selection) {
                  newAddress = selection;
                },
                fieldViewBuilder: (BuildContext context,
                    TextEditingController fieldTextEditingController,
                    FocusNode fieldFocusNode,
                    VoidCallback onFieldSubmitted) {
                  return TextField(
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                    decoration: InputDecoration(labelText: "Address"),
                    onChanged: (value) {
                      newAddress = value;
                    },
                  );
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text("Add"),
              onPressed: () {
                if (newLabel.isNotEmpty && newAddress.isNotEmpty) {
                  addLocation(newLabel, newAddress);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 31, top: 8.0, right: 36.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(width: 8),
                    Text("Saved Locations", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: showAddLocationDialog,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ReorderableListView(
                children: savedLocations
                    .asMap()
                    .entries
                    .map((entry) {
                  int index = entry.key;
                  Map<String, String> location = entry.value;
                  return ListTile(
                    key: Key('$index'),
                    title: Text("${location['label']}, ${location['address']}"),
                  );
                })
                    .toList(),
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) newIndex--;
                    final item = savedLocations.removeAt(oldIndex);
                    savedLocations.insert(newIndex, item);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class LocateChargerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 31, top: 8.0, right: 36.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.ev_station),
                SizedBox(width: 8),
                Text(
                  "Locate Charger",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    WebView(
                      initialUrl:
                      'https://www.openstreetmap.org/export/embed.html?bbox=-0.09,51.505,-0.08,51.506&layer=mapnik',
                      javascriptMode: JavascriptMode.unrestricted,
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}










class SectionWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Center(
        child: Text(
          'Widget 1',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}

class SectionWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Center(
        child: Text(
          'Widget 2',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}

class SectionWidget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Center(
        child: Text(
          'Widget 3',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}