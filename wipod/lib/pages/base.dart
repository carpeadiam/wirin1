import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wipod/pages/controls.dart';
import 'package:wipod/pages/climate.dart';
import 'package:wipod/pages/power.dart';
import 'package:wipod/pages/location.dart';
import 'package:wipod/pages/lighting.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<BasePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _goToControlsPage() {
    setState(() {
      _selectedIndex = 0; // Assuming index 0 is the ControlsPage
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      ControlsPage(),
      PowerPage(onBackButtonPressed: _goToControlsPage),
      ClimatePage(onBackButtonPressed: _goToControlsPage),
      LocationPage(onBackButtonPressed: _goToControlsPage),
      LightingPage(onBackButtonPressed: _goToControlsPage),
    ];

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 0
                  ? 'assets/images/controls_active.svg'
                  : 'assets/images/controls_inactive.svg',
              width: 24,
              height: 24,
            ),
            label: 'Controls',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 1
                  ? 'assets/images/power_active.svg'
                  : 'assets/images/power_inactive.svg',
              width: 24,
              height: 24,
            ),
            label: 'Power',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 2
                  ? 'assets/images/climate_active.svg'
                  : 'assets/images/climate_inactive.svg',
              width: 24,
              height: 24,
            ),
            label: 'Climate',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 3
                  ? 'assets/images/location_active.svg'
                  : 'assets/images/location_inactive.svg',
              width: 24,
              height: 24,
            ),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 4
                  ? 'assets/images/lighting_active.svg'
                  : 'assets/images/lighting_inactive.svg',
              width: 24,
              height: 24,
            ),
            label: 'Lighting',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black,
        //unselectedLabelStyle: TextStyle(color: Colors.black),
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
