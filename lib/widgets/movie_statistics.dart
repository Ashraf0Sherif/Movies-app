import 'package:flutter/material.dart';
import 'package:movies_app/widgets/saved_icon_button.dart';
import 'package:movies_app/widgets/star_movie_average.dart';
import '../models/movie_model.dart';
import 'favourite_icon_button.dart';

class MovieStatistics extends StatefulWidget {
  const MovieStatistics({super.key, required this.movie});

  final Movie movie;

  @override
  State<MovieStatistics> createState() => _MovieStatisticsState();
}

class _MovieStatisticsState extends State<MovieStatistics> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StarMovieAverage(movie: widget.movie),
        const Spacer(),
        FavouriteIconButton(movie: widget.movie),
        const Spacer(),
        Text(
          "${widget.movie.popularity!.toInt()}",
          style: const TextStyle(color: Colors.white),
        ),
        const Spacer(
          flex: 3,
        ),
        SavedIconButton(movie: widget.movie),
      ],
    );
  }
}
