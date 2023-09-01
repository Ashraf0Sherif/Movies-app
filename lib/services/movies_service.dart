import 'dart:convert';

import 'package:http/http.dart' as http;

import '../items/movie_class.dart';

class MoviesService {
  final String apiKey = "api_key=1566ebde9601bd69ca2daff29bcf8972";

  Future<List<MovieClass>> globalList(
      {required String path, required String category}) async {
    List<MovieClass> responseList = [];
    http.Response response = await http.get(Uri.parse("$path$apiKey"));
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
    http.Response response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/$id?$apiKey"));
    Map<String, dynamic> body = jsonDecode(response.body);
    return body;
  }
}
