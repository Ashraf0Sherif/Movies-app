import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/items/custom_list_view.dart';
import 'package:movies_app/items/custom_text.dart';
import 'package:movies_app/pages/search_page.dart';
import 'package:movies_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';
import '../models/movie.dart';

class MoviesPage extends StatefulWidget {
  MoviesPage({super.key});

  final String apiKey = "api_key=1566ebde9601bd69ca2daff29bcf8972";
  bool searched = false;

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  void fetchData() async {
    List<MovieClass> moviesList = [];
    //Trending
    http.Response response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/trending/all/day?${widget.apiKey}"));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      setState(() {
        for (int i = 0; i < body.length; i++) {
          moviesList.add(
              MovieClass(id: body["results"][i]["id"], category: "trending"));
        }
      });
    }
    //Popular
    response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?${widget.apiKey}"));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      setState(() {
        for (int i = 0; i < body.length; i++) {
          moviesList.add(
              MovieClass(id: body["results"][i]["id"], category: "popular"));
        }
      });
    }
    //Upcoming
    response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/upcoming?${widget.apiKey}"));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      setState(() {
        for (int i = 0; i < body.length; i++) {
          moviesList.add(
              MovieClass(id: body["results"][i]["id"], category: "upcoming"));
        }
      });
    }
    response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/top_rated?${widget.apiKey}"));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      setState(() {
        for (int i = 0; i < body.length; i++) {
          moviesList.add(
              MovieClass(id: body["results"][i]["id"], category: "top_rated"));
        }
      });
    }
    Map<String, List> pusher = {
      "trending":
          Provider.of<MovieProvider>(context, listen: false).trendingMovies,
      "popular":
          Provider.of<MovieProvider>(context, listen: false).popularMovies,
      "top_rated": Provider.of<MovieProvider>(context, listen: false).topRated,
    };
    for (int i = 0; i < moviesList.length; i++) {
      http.Response response = await http.get(Uri.parse(
          "https://api.themoviedb.org/3/movie/${moviesList[i].id}?${widget.apiKey}"));
      Map<String, dynamic> body = jsonDecode(response.body);
      http.Response getLink = await http.get(Uri.parse(
          "https://api.themoviedb.org/3/movie/${moviesList[i].id}/watch/providers"));
      Map<String, dynamic> bodyLink = jsonDecode(response.body);
      setState(() {
        if (moviesList[i].category == "upcoming") {
          int indx = Provider.of<MovieProvider>(context, listen: false)
              .upComingMovies
              .length;
          Provider.of<MovieProvider>(context, listen: false)
              .upComingMovies
              .add(Movie.fromJson(body));
          Provider.of<MovieProvider>(context, listen: false)
              .upComingMovies[indx]
              .avilable = false;
        } else {
          pusher[moviesList[i].category]!.add(Movie.fromJson(body));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const double height = 360;
    final provider = Provider.of<MovieProvider>(context);
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xff202126), Color(0xff19202D)])),
        child: Provider.of<MovieProvider>(context).trendingMovies.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : ListView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: TextFormField(
                      cursorColor: Colors.red,
                      cursorRadius: const Radius.circular(20),
                      cursorHeight: 19,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search for a movie',
                        hintStyle: const TextStyle(color: Colors.white60),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.white),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.white70),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      onFieldSubmitted: (text) {
                        setState(() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SearchPage(
                              text: text,
                            );
                          }));
                        });
                      },
                    ),
                  ),
                  CustomText(text: 'Trending'),
                  CustomListView(list: provider.trendingMovies, height: height),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(text: 'Popular'),
                  CustomListView(list: provider.popularMovies, height: height),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(text: 'Top Rated'),
                  CustomListView(list: provider.topRated, height: height),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(text: 'Up Coming'),
                  CustomListView(list: provider.upComingMovies, height: height),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
      ),
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    if (widget.searched) return;
    fetchData();
    widget.searched = true;
  }
}

class MovieClass {
  final int id;
  String category;

  MovieClass({required this.id, required this.category});

  @override
  String toString() {
    // TODO: implement toString
    return "id : $id , category : $category\n";
  }
}
