import 'package:flutter/material.dart';
import 'package:movies_app/widgets/saved_icon_button.dart';
import 'package:movies_app/widgets/star_movie_average.dart';
import '../models/movie_model.dart';
import 'favourite_icon_button.dart';

class MovieStatistics extends StatelessWidget {
  const MovieStatistics({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StarMovieAverage(movie: movie),
        const Spacer(),
        FavouriteIconButton(movie: movie),
        const Spacer(
          flex: 3,
        ),
        SavedIconButton(movie: movie),
      ],
    );
  }
}
