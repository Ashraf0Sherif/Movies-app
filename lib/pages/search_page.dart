import 'package:flutter/material.dart';
import 'package:movies_app/constatns.dart';
import 'package:movies_app/widgets/movie_item_vertical.dart';
import 'package:movies_app/services/movies_service.dart';
import '../models/movie_class.dart';
import '../models/movie_model.dart';
import '../widgets/error_message.dart';

class SearchPage extends StatefulWidget {
  final String? text;

  const SearchPage({super.key, this.text});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Movie> displayedMovies = [];
  bool error = false, searched = false;

  void fetchData() async {
    try {
      if (widget.text == null) return;
      List<MovieClass> searchedMoviesID = await MoviesService()
          .globalList(category: "search", searchText: widget.text);
      for (int i = 0; i < searchedMoviesID.length; i++) {
        dynamic movieDetails =
            await MoviesService().getMovieDetails(id: searchedMoviesID[i].id);
        Movie movie = Movie.fromJson(movieDetails);
        movie.link = await MoviesService().fetchLink(id: movie.id);
        displayedMovies.add(movie);
      }
    } catch (e) {
      print(e);
      error = true;
    }
    searched = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Results of : ${widget.text!}"),
          backgroundColor: const Color(0xff0F1116),
        ),
        body: Container(
          decoration: const BoxDecoration(gradient: kLinearGradient),
          child: !searched
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.red,
                ))
              : error
                  ? const ErrorMessage()
                  : ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, int index) {
                        return MovieItemVertical(movie: displayedMovies[index]);
                      },
                      itemCount: displayedMovies.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          height: 1,
                          thickness: 1.5,
                          indent: 60,
                          endIndent: 60,
                          color: kPrimaryColor,
                        );
                      },
                    ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
  }
}
