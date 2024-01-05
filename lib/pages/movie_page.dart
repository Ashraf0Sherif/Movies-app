import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/constatns.dart';
import 'package:movies_app/widgets/favourite_icon_button.dart';
import 'package:movies_app/widgets/movie_genres.dart';
import 'package:movies_app/widgets/movie_status.dart';
import 'package:movies_app/widgets/saved_icon_button.dart';
import 'package:movies_app/widgets/star_movie_average.dart';
import '../models/movie_model.dart';
import 'package:intl/intl.dart';
import '../widgets/watch_button.dart';

class MoviePage extends StatelessWidget {
  final Movie movie;

  const MoviePage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Text(movie.originalTitle ?? "No Title"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: null,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Container(
            decoration: const BoxDecoration(gradient: kLinearGradient),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Container(
                decoration: const BoxDecoration(gradient: kLinearGradient),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(movie.backdrop!),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    BlurryContainer(
                      color: kPrimaryColor,
                      child: SelectableText(
                        movie.originalTitle ?? "No Title",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    BlurryContainer(
                      color: kPrimaryColor,
                      child: Text(
                        movie.overview != null && movie.overview != ""
                            ? movie.overview!
                            : "there is no overview yet !",
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    MovieStatus(movie: movie),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        BlurryContainer(
                          color: kPrimaryColor,
                          child: Text(
                            "Budget : ${movie.budget != 0 && movie.budget != null ? "\$ ${NumberFormat("#,##0", "en_US").format(movie.budget)}" : "Unknown"}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        const Spacer(),
                        StarMovieAverage(movie: movie),
                        const Spacer(),
                        BlurryContainer(
                          color: kPrimaryColor,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                              Text(
                                "${movie.runtime ?? 0}",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    MovieGenres(genres: movie.genres),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        FavouriteIconButton(movie: movie),
                        SavedIconButton(movie: movie),
                      ],
                    ),
                    WatchButton(
                      movie: movie,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
