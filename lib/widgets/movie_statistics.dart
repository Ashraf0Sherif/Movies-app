import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/widgets/saved_icon_button.dart';

import '../models/movie_model.dart';
import 'favourite_icon_button.dart';

class MovieStatistics extends StatelessWidget {
  const MovieStatistics({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlurryContainer(
          color: const Color(0xff262A34),
          width: 60,
          child: Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              const Spacer(),
              Text(
                "${movie.voteAverage!.toInt()}",
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        const Spacer(),
        FavouriteIconButton(movie: movie),
        const Spacer(),
        Text(
          "${movie.popularity!.toInt()}",
          style: const TextStyle(color: Colors.white),
        ),
        const Spacer(
          flex: 3,
        ),
        SavedIconButton(movie: movie),
      ],
    );
  }
}
