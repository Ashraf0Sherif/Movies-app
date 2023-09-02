import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/widgets/favourite_icon_button.dart';
import 'package:movies_app/widgets/saved_icon_button.dart';
import 'package:movies_app/pages/movie_page.dart';
import 'package:provider/provider.dart';

import '../models/movie_model.dart';
import '../providers/movie_provider.dart';
import 'movie_genres.dart';

class MovieItemVertical extends StatefulWidget {
  final Movie movie;
  const MovieItemVertical({super.key, required this.movie});

  @override
  State<MovieItemVertical> createState() => _MovieItemVerticalState();
}

class _MovieItemVerticalState extends State<MovieItemVertical> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);
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
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MoviePage(movie: widget.movie,);
                  }));
                },
                child: Container(
                  width: 120,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    image: DecorationImage(
                      image: NetworkImage(widget.movie.posterPath != null
                          ? "https://image.tmdb.org/t/p/w500/${widget.movie.posterPath}"
                          : "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/660px-No-Image-Placeholder.svg.png?20200912122019"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  BlurryContainer(
                    color: const Color(0xff262A34),
                    child: Text(
                      widget.movie.originalTitle!,
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
                  Row(
                    children: [
                      BlurryContainer(
                          color: const Color(0xff262A34),
                          child: Text(
                            widget.movie.releaseDate==""?"Still not released":widget.movie.releaseDate!,
                            style: const TextStyle(color: Colors.white),
                          )),
                      const Spacer(),
                      BlurryContainer(
                          color: const Color(0xff262A34),
                          child: Text(
                            "${widget.movie.status}",
                            style: const TextStyle(color: Colors.white),
                          )),
                      const Spacer()
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MovieGenres(widget: widget),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
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
                                "${widget.movie.voteAverage!.toInt()}",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          )),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
