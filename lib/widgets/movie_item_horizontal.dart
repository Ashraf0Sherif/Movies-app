import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/constatns.dart';
import 'package:movies_app/widgets/favourite_icon_button.dart';
import 'package:movies_app/widgets/saved_icon_button.dart';
import 'package:movies_app/pages/movie_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../models/movie_model.dart';

class MovieItemHorizontal extends StatelessWidget {
  final Movie movie;

  const MovieItemHorizontal({super.key, required this.movie});

  final int duration = 520;

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
          width: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              image: DecorationImage(
                  image: NetworkImage(movie.posterPath != null
                      ? "https://image.tmdb.org/t/p/w500/${movie.posterPath}"
                      : kNullImage),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  FavouriteIconButton(movie: movie),
                  Text(
                    "${movie.popularity?.toInt()}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  Expanded(
                    child: BlurryContainer(
                      padding: const EdgeInsets.all(3),
                      blur: 0,
                      color: kPrimaryColor.withOpacity(0.3),
                      child: Text(
                        movie.originalTitle ?? "No Title",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SavedIconButton(movie: movie),
                ],
              ),
              const Spacer(),
              Wrap(
                direction: Axis.horizontal,
                children: movie.genres.map(
                  (e) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 3),
                      child: Container(
                        padding: const EdgeInsets.all(1.5),
                        decoration: BoxDecoration(
                            color: const Color(0xff1A202C).withOpacity(0.7),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          e,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: const Color(0xff1A202C).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Voting average : ${movie.voteAverage != null ? movie.voteAverage.toInt() : "Unknown"}",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 50),
                child: LinearPercentIndicator(
                  animationDuration: 600,
                  animation: true,
                  lineHeight: 2,
                  percent: movie.voteAverage != null
                      ? movie.voteAverage.ceil() / 10
                      : 0,
                  progressColor: const Color(0xff21D07A),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}