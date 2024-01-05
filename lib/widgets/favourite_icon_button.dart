import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/favourite_cubit/favourite_cubit.dart';
import 'package:movies_app/cubits/movies_cubit/movies_cubit.dart';

import '../models/movie_model.dart';

class FavouriteIconButton extends StatelessWidget {
  final Movie movie;

  const FavouriteIconButton({super.key, required this.movie});

  final int duration = 520;

  @override
  Widget build(BuildContext context) {
    final moviesCubit = BlocProvider.of<MoviesCubit>(context);
    final favouriteCubit = BlocProvider.of<FavouriteCubit>(context);
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      builder: (context, state) {
        return Row(
          children: [
            IconButton(
              onPressed: () {
                if (movie.isFav == false) {
                  favouriteCubit.addFavourite();
                  moviesCubit.addFav(movie);
                } else {
                  favouriteCubit.remFavourite();
                  moviesCubit.removeFav(movie);
                }
              },
              icon: AnimatedSwitcher(
                duration: Duration(milliseconds: duration),
                child: movie.isFav == true
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
            ),
            Text(
              "${movie.popularity?.toInt()}   ",
              style: const TextStyle(color: Colors.white),
            ),
          ],
        );
      },
    );
  }
}
