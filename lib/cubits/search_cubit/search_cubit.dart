import 'package:bloc/bloc.dart';

import '../../models/movie_class.dart';
import '../../models/movie_model.dart';
import '../../services/movies_service.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  List<Movie> displayedMovies = [];

  void fetchData({required String text}) async {
    displayedMovies = [];
    try {
      List<MovieClass> searchedMoviesID = await MoviesService()
          .globalList(category: "search", searchText: text);
      for (int i = 0; i < searchedMoviesID.length; i++) {
        dynamic movieDetails =
            await MoviesService().getMovieDetails(id: searchedMoviesID[i].id);
        Movie movie = Movie.fromJson(movieDetails);
        movie.link = await MoviesService().fetchLink(id: movie.id);
        displayedMovies.add(movie);
      }
      emit(SearchSuccess());
    } catch (e) {
      emit(SearchFailure());
    }
  }
  void toInitial(){
    emit(SearchInitial());
  }
}
