import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';

import '../models/movie_model.dart';
class StarMovieAverage extends StatelessWidget {
  const StarMovieAverage({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      color: kPrimaryColor,
      width: 60,
      child: Row(
        children: [
          const Icon(
            Icons.star,
            color: Colors.yellow,
          ),
          const Spacer(),
          Text(
            "${movie.voteAverage != null ? movie.voteAverage.toInt() : 0}",
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}