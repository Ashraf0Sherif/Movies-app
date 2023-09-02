import 'dart:convert';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/widgets/favourite_icon_button.dart';
import 'package:movies_app/widgets/movie_genres.dart';
import 'package:movies_app/widgets/saved_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class MoviePage extends StatefulWidget {
  final Movie movie;

  MoviePage({super.key, required this.movie});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final String apiKey = "api_key=1566ebde9601bd69ca2daff29bcf8972";
  String link = "";

  String image(Movie movie) {
    if (movie.backdrop != null) {
      return "https://image.tmdb.org/t/p/w500/${movie.backdrop}";
    } else if (movie.posterPath != null) {
      return "https://image.tmdb.org/t/p/w500/${movie.posterPath}";
    }
    return "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/660px-No-Image-Placeholder.svg.png?20200912122019";
  }

  void fetchLink() async {
    http.Response response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/${widget.movie.id}/watch/providers?$apiKey"));
    Map<String, dynamic> body = jsonDecode(response.body);
    setState(() {
      try {
        link = body["results"]["EG"]["link"];
      } catch (e) {
        print("Can't get the link of : ${widget.movie.originalTitle} ");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F1116),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff0F1116),
        title: Text(widget.movie.originalTitle ?? "No Title"),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xff202126), Color(0xff19202D)])),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff202126), Color(0xff19202D)])),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(image(widget.movie)),
                ),
                const SizedBox(
                  height: 12,
                ),
                BlurryContainer(
                  color: const Color(0xff262A34),
                  child: SelectableText(
                    widget.movie.originalTitle ?? "No Title",
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
                  color: const Color(0xff262A34),
                  child: Text(
                    widget.movie.overview!=null?widget.movie.overview!:"there is no overview yet !",
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.justify,
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
                        widget.movie.releaseDate == null
                            ? "Still not released"
                            : widget.movie.releaseDate!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Spacer(),
                    BlurryContainer(
                      color: const Color(0xff262A34),
                      width: 65,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          const Spacer(),
                          Text(
                            "${widget.movie.voteAverage!=null?widget.movie.voteAverage.toInt():0}",
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    BlurryContainer(
                      color: const Color(0xff262A34),
                      child: Text(
                        "Budget : ${widget.movie.budget != 0 &&widget.movie.budget!=null? "\$ ${NumberFormat("#,##0", "en_US").format(widget.movie.budget)}" : "Unknown"}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                    BlurryContainer(
                      color: const Color(0xff262A34),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                          Text(
                            "${widget.movie.runtime ?? 0}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    BlurryContainer(
                      color: const Color(0xff262A34),
                      child: Text(
                        "${widget.movie.status??0}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                MovieGenres(genres: widget.movie.genres),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    FavouriteIconButton(movie: widget.movie),
                    Text(
                      "${widget.movie.popularity!=null?widget.movie.popularity!.toInt():""}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    SavedIconButton(movie: widget.movie),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        disabledBackgroundColor: Colors.grey,
                        disabledForegroundColor: Colors.white),
                    onPressed: (link != "" && widget.movie.avilable==true)
                        ? () {
                            launchUrl(Uri.parse(link),
                                mode: LaunchMode.externalApplication);
                          }
                        : null,
                    child: Text((link != "" && widget.movie.avilable==true)
                        ? "Watch Now"
                        : "Coming Soon"),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchLink();
  }
}
