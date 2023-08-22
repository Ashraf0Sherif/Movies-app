import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/movie.dart';
import '../providers/movie_provider.dart';

class FavouriteIconButton extends StatelessWidget {
  final Movie movie;

  const FavouriteIconButton({super.key, required this.movie});

  final int duration = 520;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);
    return IconButton(
      onPressed: () {
        if (movie.isFav) {
          movie.isFav = false;
          movie.popularity--;
          provider.removeFav(movie);
        } else {
          movie.isFav = true;
          movie.popularity++;
          provider.addFav(movie);
        }
      },
      icon: AnimatedSwitcher(
        duration: Duration(milliseconds: duration),
        child: movie.isFav
            ? const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 25.8,
                key: ValueKey(1),
              )
            : const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
      ),
    );
  }
}
