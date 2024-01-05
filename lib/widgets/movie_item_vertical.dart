import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';

import '../models/movie_model.dart';
import 'movie_genres.dart';
import 'movie_poster.dart';
import 'movie_statistics.dart';
import 'movie_status.dart';

class MovieItemVertical extends StatelessWidget {
  final Movie movie;

  const MovieItemVertical({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff181A20),
      width: double.infinity,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MoviePoster(movie: movie),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  BlurryContainer(
                    color: kPrimaryColor,
                    child: Text(
                      movie.originalTitle!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  MovieStatus(
                    movie: movie,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MovieGenres(genres: movie.genres),
                  const SizedBox(
                    height: 8,
                  ),
                  MovieStatistics(movie: movie),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
