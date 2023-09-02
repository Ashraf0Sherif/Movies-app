import 'package:flutter/material.dart';

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
                  : "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/660px-No-Image-Placeholder.svg.png?20200912122019"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}