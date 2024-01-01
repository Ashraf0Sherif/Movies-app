import 'package:flutter/material.dart';
import 'package:movies_app/widgets/custom_list_view.dart';
import 'package:movies_app/widgets/custom_text.dart';
import 'package:movies_app/pages/search_page.dart';
import 'package:movies_app/providers/movie_provider.dart';
import 'package:movies_app/services/movies_service.dart';
import 'package:movies_app/widgets/error_message.dart';
import 'package:provider/provider.dart';
import '../constatns.dart';
import '../models/movie_class.dart';
import '../models/movie_model.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  bool error = false;

  void fetchData() async {
    final provider = Provider.of<MovieProvider>(context, listen: false);
    Map<String, List> pusher = {
      "trending": provider.trendingMovies,
      "popular": provider.popularMovies,
      "top_rated": provider.topRated,
      "upcoming": provider.upComingMovies
    };
    ////
    try {
      List<MovieClass> getTrendingList =
          await MoviesService().globalList(category: "trending");
      List<MovieClass> getPopularList =
          await MoviesService().globalList(category: "popular");
      List<MovieClass> getUpComingList =
          await MoviesService().globalList(category: "upcoming");
      List<MovieClass> getTopRatedList =
          await MoviesService().globalList(category: "top_rated");
      List<MovieClass> moviesList = [
        ...getTrendingList,
        ...getTopRatedList,
        ...getPopularList,
        ...getUpComingList
      ];
      Map<int, bool> vis = {};
      for (int i = 0; i < moviesList.length; i++) {
        if (vis[moviesList[i].id] == true) continue;
        vis[moviesList[i].id] = true;
        dynamic movieDetails =
            await MoviesService().getMovieDetails(id: moviesList[i].id);
        Movie movie = Movie.fromJson(movieDetails);
        if (movie.originalTitle == null) continue;
        movie.link = await MoviesService().fetchLink(id: moviesList[i].id);
        if (pusher[moviesList[i].category] != null) {
          setState(() {
            pusher[moviesList[i].category]!.add(movie);
          });
        }
      }
    } catch (e) {
      error = true;
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    const double height = 360;
    final provider = Provider.of<MovieProvider>(context);
    return SafeArea(
        child: GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(gradient: kLinearGradient),
          child: provider.trendingMovies.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                )
              : error
                  ? const ErrorMessage()
                  : ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          child: TextFormField(
                            cursorColor: Colors.red,
                            cursorRadius: const Radius.circular(20),
                            cursorHeight: 19,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Search for a movie',
                              hintStyle: const TextStyle(color: Colors.white60),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.white70),
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
                        CustomListView(
                            list: provider.trendingMovies, height: height),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomText(text: 'Popular'),
                        CustomListView(
                            list: provider.popularMovies, height: height),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomText(text: 'Top Rated'),
                        CustomListView(list: provider.topRated, height: height),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomText(text: 'Up Coming'),
                        CustomListView(
                            list: provider.upComingMovies, height: height),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
        ),
      ),
    ));
  }

  @override
  void initState() {
    if (Provider.of<MovieProvider>(context, listen: false)
        .trendingMovies
        .isEmpty) {
      fetchData();
    }
  }
}
