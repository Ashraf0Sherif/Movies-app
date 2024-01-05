import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';

import '../models/movie_model.dart';
import '../pages/movie_page.dart';
class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MoviePage(
              movie: movie,
            );
          }));
        },
        child: Container(
          width: 120,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            image: DecorationImage(
              image: NetworkImage(movie.posterPath != null
                  ? "https://image.tmdb.org/t/p/w500/${movie.posterPath}"
                  : kNullImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}