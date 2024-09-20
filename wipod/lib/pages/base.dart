import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wipod/pages/colorlight.dart';
import 'package:wipod/pages/controls.dart';
import 'package:wipod/pages/climate.dart';
import 'package:wipod/pages/power.dart';
import 'package:wipod/pages/location.dart';
import 'package:wipod/pages/lighting.dart';
import 'package:wipod/pages/ambient.dart';
import 'package:wipod/pages/music.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<BasePage> {
  int _selectedIndex = 0;
  bool _isSubPage = false;
  int _subPageIndex = 0;
  String _searchQuery = '';
  List<String> _pagesList = [
    'Controls',
    'Power',
    'Climate',
    'Location',
    'Lighting',
    'Ambient',
    'Music',
    'Color Light',
  ];
  List<String> _filteredPages = [];

  // Handles bottom navigation tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isSubPage = false;
      _searchQuery = '';
    });
  }

  // Functions for navigating to subpages
  void _goToAmbientPage() {
    setState(() {
      _isSubPage = true;
      _subPageIndex = 0;
      _searchQuery = '';
    });
  }

  void _goToMusicPage() {
    setState(() {
      _isSubPage = true;
      _subPageIndex = 1;
      _searchQuery = '';
    });
  }

  void _goToColorsPage() {
    setState(() {
      _isSubPage = true;
      _subPageIndex = 2;
      _searchQuery = '';
    });
  }

  // Function for navigating back to the Controls page
  void _goToControlsPage() {
    setState(() {
      _selectedIndex = 0;
      _isSubPage = false;
    });
  }

  // Handles search input
  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
      _filteredPages = _pagesList
          .where((page) => page.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  // Function to navigate based on search result
  void _navigateToPage(String page) {
    if (page == 'Controls') {
      _onItemTapped(0);
    } else if (page == 'Power') {
      _onItemTapped(1);
    } else if (page == 'Climate') {
      _onItemTapped(2);
    } else if (page == 'Location') {
      _onItemTapped(3);
    } else if (page == 'Lighting') {
      _onItemTapped(4);
    } else if (page == 'Ambient') {
      _goToAmbientPage();
    } else if (page == 'Music') {
      _goToMusicPage();
    } else if (page == 'Color Light') {
      _goToColorsPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      ControlsPage(),
      PowerPage(onBackButtonPressed: _goToControlsPage),
      ClimatePage(onBackButtonPressed: _goToControlsPage),
      LocationPage(onBackButtonPressed: _goToControlsPage),
      LightingPage(
        onBackButtonPressed: _goToControlsPage,
        onCustomizePressed: _goToAmbientPage,
        onCustomizePressed2: _goToMusicPage,
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          // Expanded section for the main content (pages or search results)
          Expanded(
            child: _searchQuery.isNotEmpty
                ? ListView.builder(
              itemCount: _filteredPages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filteredPages[index]),
                  onTap: () => _navigateToPage(_filteredPages[index]),
                );
              },
            )
                : _isSubPage
                ? (_subPageIndex == 0
                ? AmbientPage(
              onBackButtonPressed: _goToControlsPage,
              onColorPressed: _goToColorsPage,
            )
                : _subPageIndex == 1
                ? MusicPage(onBackButtonPressed: _goToControlsPage)
                : _subPageIndex == 2
                ? ColorLightPage(onBackButtonPressed: _goToControlsPage)
                : Container()) // Fallback widget in case no valid subpage
                : _pages[_selectedIndex],
          ),
          // Search bar at the bottom, visible only when on Controls Page
          if (_selectedIndex == 0 && !_isSubPage)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search pages...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: _onSearchChanged,
              ),
            ),
        ],
      ),
      // Bottom navigation bar
      bottomNavigationBar: _isSubPage
          ? null
          : BottomNavigationBar(
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
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
