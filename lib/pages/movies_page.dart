import 'package:flutter/material.dart';
import 'package:movies_app/widgets/custom_list_view.dart';
import 'package:movies_app/widgets/custom_text.dart';
import 'package:movies_app/pages/search_page.dart';
import 'package:movies_app/providers/movie_provider.dart';
import 'package:movies_app/services/movies_service.dart';
import 'package:provider/provider.dart';
import '../models/movie_class.dart';
import '../models/movie_model.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  void fetchData() async {
    Map<String, List> pusher = {
      "trending":
          Provider.of<MovieProvider>(context, listen: false).trendingMovies,
      "popular":
          Provider.of<MovieProvider>(context, listen: false).popularMovies,
      "top_rated": Provider.of<MovieProvider>(context, listen: false).topRated,
      "upcoming":
          Provider.of<MovieProvider>(context, listen: false).upComingMovies
    };
    try {
      List<MovieClass> moviesList = [];
      List<MovieClass> getterList = await MoviesService().globalList(
          path: "https://api.themoviedb.org/3/trending/all/day?",
          category: "trending");
      moviesList = [...moviesList, ...getterList];
      getterList = await MoviesService().globalList(
          path: "https://api.themoviedb.org/3/movie/popular?",
          category: "popular");
      moviesList = [...moviesList, ...getterList];
      getterList = await MoviesService().globalList(
          path: "https://api.themoviedb.org/3/movie/upcoming?",
          category: "upcoming");
      moviesList = [...moviesList, ...getterList];
      getterList = await MoviesService().globalList(
          path: "https://api.themoviedb.org/3/movie/top_rated?",
          category: "top_rated");
      moviesList = [...moviesList, ...getterList];
      for (int i = 0; i < moviesList.length; i++) {
        dynamic movieDetails =
            await MoviesService().getMovieDetails(id: moviesList[i].id);
        setState(() {
          if (pusher[moviesList[i].category] != null) {
            pusher[moviesList[i].category]!.add(Movie.fromJson(movieDetails));
          }
        });
      }
    } catch (e) {
      print(e);
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
        child: provider.trendingMovies.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : ListView(
                physics: const BouncingScrollPhysics(),
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
    if (Provider.of<MovieProvider>(context, listen: false)
        .trendingMovies
        .isEmpty) {
      fetchData();
    }
  }
}
