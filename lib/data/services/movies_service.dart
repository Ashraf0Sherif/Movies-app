import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/movie_class.dart';

class MoviesService {
  final String apiKey = "api_key=1566ebde9601bd69ca2daff29bcf8972";
  Map<String, String> path = {
    "trending": "https://api.themoviedb.org/3/trending/all/day?",
    "popular": "https://api.themoviedb.org/3/movie/popular?",
    "upcoming": "https://api.themoviedb.org/3/movie/upcoming?",
    "top_rated": "https://api.themoviedb.org/3/movie/top_rated?"
  };

  Future<List<MovieClass>> globalList(
      {required String category, String? searchText}) async {
    List<MovieClass> responseList = [];
    http.Response response;
    if (searchText == null) {
      response = await http.get(Uri.parse("${path[category]}$apiKey"));
    } else {
      response = await http.get(Uri.parse(
          "https://api.themoviedb.org/3/search/movie?query=$searchText&include_adult=false&language=en-US&page=1&$apiKey"));
    }
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      for (int i = 0; i < body.length; i++) {
        responseList
            .add(MovieClass(id: body["results"][i]["id"], category: category));
      }
    }
    return responseList;
  }

  dynamic getMovieDetails({required int id}) async {
    http.Response response = await http
        .get(Uri.parse("https://api.themoviedb.org/3/movie/$id?$apiKey"));
    Map<String, dynamic> body = jsonDecode(response.body);
    return body;
  }

  Future<String?> fetchLink({required int id}) async {
    http.Response response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/$id/watch/providers?$apiKey"));
    Map<String, dynamic> body = jsonDecode(response.body);
    try {
      return body["results"]["EG"]["link"];
    } catch (e) {
      return "";
    }
  }
}
