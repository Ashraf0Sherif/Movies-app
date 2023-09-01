import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/items/movie_item_vertical.dart';
import '../models/movie.dart';

class SearchPage extends StatefulWidget {
  final String? text;
  SearchPage({super.key, this.text});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final String apiKey="api_key=1566ebde9601bd69ca2daff29bcf8972";
  List<int> searchedMoviesID = [];
  List<Movie> displayedMovies=[];
  void fetchData() async {
    if (widget.text == null) return;
    http.Response response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/search/movie?query=${widget.text}&include_adult=false&language=en-US&page=1&$apiKey"));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      for (int i = 0; i < body.length; i++) {
        try{
          searchedMoviesID.add(body["results"][i]["id"]);
        }catch(e){
          print("no result for item number $i");
        }
      }
        for(int i=0;i<searchedMoviesID.length;i++){
          http.Response response = await http.get(
              Uri.parse("https://api.themoviedb.org/3/movie/${searchedMoviesID[i]}?$apiKey"));
          Map<String, dynamic> body = jsonDecode(response.body);
          displayedMovies.add(Movie.fromJson(body));
        }
        setState(() {
          displayedMovies;
        });
    }
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
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff202126), Color(0xff19202D)])),
            child: displayedMovies.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.red,))
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
                        color: Color(0xff262A34),
                      );
                    },
                  ),
          )),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
  }
}
