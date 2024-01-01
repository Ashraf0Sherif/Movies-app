import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movies_app/pages/reacted_page.dart';

import 'package:movies_app/pages/movies_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  final tabs = [
    const MoviesPage(),
    const ReactedPage(list: "favourite"),
    const ReactedPage(list: "saved"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GNav(
            selectedIndex: _currentIndex,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.favorite,
                text: "Favourites",
              ),
              GButton(
                icon: Icons.bookmark,
                text: "Saved",
              ),
            ],
            gap: 8,
            activeColor: Colors.white,
            backgroundColor: Colors.black,
            color: Colors.white,
            tabBackgroundColor: Colors.white10,
            padding: const EdgeInsets.all(20),
            onTabChange: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
