import 'package:bloc/bloc.dart';

import '../../models/movie_class.dart';
import '../../models/movie_model.dart';
import '../../services/movies_service.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesLoading());
  List<Movie> trendingMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> upComingMovies = [];
  List<Movie> topRated = [];
  List<Movie> favMovies = [];
  List<Movie> savedMovies = [];
  Map<int, bool> vis = {};

  void fetchAll() async {
    Map<String, List> pusher = {
      "trending": trendingMovies,
      "popular": popularMovies,
      "top_rated": topRated,
      "upcoming": upComingMovies
    };
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
      for (int i = 0; i < moviesList.length; i++) {
        if (vis[moviesList[i].id] == true) continue;
        vis[moviesList[i].id] = true;
        dynamic movieDetails =
            await MoviesService().getMovieDetails(id: moviesList[i].id);
        Movie movie = Movie.fromJson(movieDetails);
        if (movie.originalTitle == null) continue;
        movie.link = await MoviesService().fetchLink(id: moviesList[i].id);
        if (pusher[moviesList[i].category] != null) {
          pusher[moviesList[i].category]!.add(movie);
        }
      }
      emit(MoviesSuccess());
    } catch (e) {
      print(e);
      emit(MoviesFailure());
    }
  }

  //Add and remove react functions
  void addFav(Movie movie) {
    movie.isFav = true;
    favMovies.add(movie);
  }

  void removeFav(Movie movie) {
    movie.isFav = false;
    favMovies.remove(movie);
  }

  void addSave(Movie movie) {
    movie.saved = true;
    savedMovies.add(movie);
  }

  void removeSave(Movie movie) {
    movie.saved = false;
    savedMovies.remove(movie);
  }
}
