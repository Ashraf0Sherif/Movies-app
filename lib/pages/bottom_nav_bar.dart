import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movies_app/cubits/nav_bar_cubit/nav_bar_cubit.dart';
import 'package:movies_app/pages/reacted_page.dart';
import 'package:movies_app/pages/movies_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          if (state is NavBarReactedPage) {
            return const ReactedPage();
          } else {
            return const MoviesPage();
          }
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GNav(
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
              BlocProvider.of<NavBarCubit>(context).getPage(index: index);
            },
          ),
        ),
      ),
    );
  }
}
