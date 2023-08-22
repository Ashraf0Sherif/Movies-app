import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/items/custom_list_view.dart';
import 'package:provider/provider.dart';

import '../items/movie_item_horizontal.dart';
import '../providers/movie_provider.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xff202126), Color(0xff19202D)])),
        child: provider.favMovies.isEmpty
            ? const Center(
                child: BlurryContainer(
                  color: Color(0xff262A34),
                  child: Text(
                    "Add some movies",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            : ListView(
                children: [
                  const SizedBox(height: 40,),
                  CustomListView(list: provider.favMovies, height: 420),
                ],
              ),
      ),
    );
  }
}
