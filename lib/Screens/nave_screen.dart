import 'package:flutter/material.dart';
import 'package:youtube_ui/Screens/home_screen.dart';

class NaveScreen extends StatefulWidget {
  @override
  _NaveScreenState createState() => _NaveScreenState();
}

class _NaveScreenState extends State<NaveScreen> {
  int _selectedIndex = 0;

  final _screens = [
    HomeScreen(),
    const Scaffold(body: Center(child: Text("Explore"))),
    const Scaffold(body: Center(child: Text("add"))),
    const Scaffold(body: Center(child: Text("subscriptions"))),
    const Scaffold(body: Center(child: Text("library"))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: _screens
            .asMap()
            .map((i, screen) => MapEntry(
                i,
                Offstage(
                  offstage: _selectedIndex != i,
                  child: screen,
                )))
            .values
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        onTap: (i) => setState(() => _selectedIndex = i),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.explore_outlined,
                size: 21,
              ),
              activeIcon: Icon(
                Icons.explore,
                size: 21,
              ),
              label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline,
                size: 30,
              ),
              activeIcon: Icon(Icons.add_circle),
              label: "Add"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.subscriptions_outlined,
                size: 21,
              ),
              activeIcon: Icon(
                Icons.subscriptions,
                size: 21,
              ),
              label: "Subscriptions"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.video_library_outlined,
                size: 21,
              ),
              activeIcon: Icon(
                Icons.video_library,
                size: 21,
              ),
              label: "Library"),
        ],
      ),
    );
  }
}
