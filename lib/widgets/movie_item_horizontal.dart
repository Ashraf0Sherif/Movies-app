import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/widgets/favourite_icon_button.dart';
import 'package:movies_app/widgets/saved_icon_button.dart';
import 'package:movies_app/pages/movie_page.dart';
import 'package:movies_app/widgets/voting_widget.dart';
import '../models/movie_model.dart';
import 'movie_genres.dart';
import 'movie_title.dart';

class MovieItemHorizontal extends StatelessWidget {
  final Movie movie;

  const MovieItemHorizontal(
      {super.key, required this.movie, required this.width});

  final int duration = 520;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return MoviePage(
                  movie: movie,
                );
              },
            ),
          );
        },
        child: Container(
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            image: DecorationImage(
              image: NetworkImage(movie.posterPath != null
                  ? "https://image.tmdb.org/t/p/w500/${movie.posterPath}"
                  : kNullImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  FavouriteIconButton(movie: movie),
                  Expanded(
                    child: MovieTitle(
                      movieTitle: movie.originalTitle ?? "No Title",),
                  ),
                  SavedIconButton(movie: movie),
                ],
              ),
              const Spacer(),
              MovieGenres(genres: movie.genres),
              VotingBar(movie: movie)
            ],
          ),
        ),
      ),
    );
  }
}

