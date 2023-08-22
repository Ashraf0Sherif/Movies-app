import 'package:flutter/foundation.dart';

import '../models/movie.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> trendingMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> upComingMovies = [];
  List<Movie> topRated = [];
  List<Movie> favMovies = [];
  List<Movie> savedMovies = [];

  void addFav(Movie movie) {
    movie.isFav = true;
    favMovies.add(movie);
    notifyListeners();
  }

  void removeFav(Movie movie) {
    movie.isFav = false;
    favMovies.remove(movie);
    notifyListeners();
  }

  void addSave(Movie movie) {
    movie.saved = true;
    savedMovies.add(movie);
    notifyListeners();
  }

  void removeSave(Movie movie) {
    movie.saved = false;
    savedMovies.remove(movie);
    notifyListeners();
  }
  bool checker(){
    return trendingMovies.isEmpty&&popularMovies.isEmpty&&upComingMovies.isEmpty&&topRated.isEmpty;
  }
}
