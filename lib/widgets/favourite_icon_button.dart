import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/movie_model.dart';
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
        if (movie.isFav==true) {
          movie.isFav = false;
          if(movie.popularity!=null) {
            movie.popularity--;
          }
          provider.removeFav(movie);
        } else {
          movie.isFav = true;
          if(movie.popularity!=null) {
            movie.popularity++;
          }
          provider.addFav(movie);
        }
      },
      icon: AnimatedSwitcher(
        duration: Duration(milliseconds: duration),
        child: movie.isFav==true
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
