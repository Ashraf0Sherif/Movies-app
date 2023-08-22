import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movies_app/pages/favourites_page.dart';
import 'package:movies_app/pages/saved_page.dart';

import 'package:movies_app/pages/movies_page.dart';

class DisplayedPage extends StatefulWidget {
  const DisplayedPage({super.key});

  @override
  State<DisplayedPage> createState() => _DisplayedPageState();
}

class _DisplayedPageState extends State<DisplayedPage> {
  int _currentIndex = 0;
  final tabs = [
    MoviesPage(),
    const FavouritesPage(),
    const SavedPage(),
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
