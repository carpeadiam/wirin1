import 'package:flutter/material.dart';
import 'package:wipod/pages/profilesSections.dart';
import 'package:wipod/pages/section.dart';


class ProfilesPage extends StatefulWidget {
  @override
  _ProfilesPageState createState() => _ProfilesPageState();
}

class _ProfilesPageState extends State<ProfilesPage> {
  // Variables to store user data
  String name = "Billy Butcher";
  String phoneNumber = "+91 9876543210";
  String nickname = "Billi";
  String dateOfBirth = "31st February 2005";
  String region = "India";

  // Controllers for text fields
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController nicknameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: name);
    phoneController = TextEditingController(text: phoneNumber);
    nicknameController = TextEditingController(text: nickname);
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    nicknameController.dispose();
    super.dispose();
  }

  // Method to display the edit dialog
  void _showEditDialog(String title, TextEditingController controller) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit $title"),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: title,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  // Update the value in the respective field
                  switch (title) {
                    case "Name":
                      name = controller.text;
                      break;
                    case "Phone Number":
                      phoneNumber = controller.text;
                      break;
                    case "Nickname":
                      nickname = controller.text;
                      break;
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  // Method to display the date picker
  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        dateOfBirth = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profiles',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white,
      ),
      body: ListView(
        children: [
          ProfilePhotoWidget(),
          SectionLine(),
          ProfileEditableField(
            title: "Name",
            value: name,
            iconPath: 'assets/images/name_icon.svg',
            onTap: () => _showEditDialog("Name", nameController),
          ),
          SectionLine(),
          ProfileEditableField(
            title: "Phone Number",
            value: phoneNumber,
            iconPath: 'assets/images/phone_icon.svg',
            onTap: () => _showEditDialog("Phone Number", phoneController),
          ),
          SectionLine(),
          ProfileEditableField(
            title: "Nickname",
            value: nickname,
            iconPath: 'assets/images/nickname_icon.svg',
            onTap: () => _showEditDialog("Nickname", nicknameController),
          ),
          SectionLine(),
          DateOfBirthField(
            title: "Date of Birth",
            value: dateOfBirth,
            iconPath: 'assets/images/dob_icon.svg',
            onTap: _selectDate,
          ),
          SectionLine(),
          ProfileEditableField(
            title: "Region",
            value: region,
            iconPath: 'assets/images/region_icon.svg',
            onTap: () {
              // Handle region change here, e.g., show a dialog to pick the region
            },
          ),
        ],
      ),
    );
  }
}
