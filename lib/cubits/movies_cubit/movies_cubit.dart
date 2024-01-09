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
  List<int> favReact = [];
  List<Movie> savedMovies = [];
  List<int> savedReact = [];
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
  //Favourite functions
  void addFav(Movie movie) {
    if (!checkFavourite(id: movie.id)) {
      favMovies.add(movie);
      favReact.add(movie.id);
    }
  }

  void removeFav(Movie movie) {
    favReact.remove(movie.id);
    favMovies.removeWhere((item) => item.id == movie.id);
  }

  bool checkFavourite({required int id}) {
    var myListFiltered = favReact.where((e) => e == id);
    if (myListFiltered.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  //Save functions
  void addSave(Movie movie) {
    savedReact.add(movie.id);
    savedMovies.add(movie);
  }

  void removeSave(Movie movie) {
    savedReact.remove(movie.id);
    savedMovies.removeWhere((item) => item.id == movie.id);
  }

  bool checkSaved({required int id}) {
    var myListFiltered = savedReact.where((e) => e == id);
    if (myListFiltered.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
