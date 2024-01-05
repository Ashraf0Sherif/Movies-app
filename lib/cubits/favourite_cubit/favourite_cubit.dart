import 'package:bloc/bloc.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());

  void addFavourite() {
    emit(FavouriteReact());
  }

  void remFavourite() {
    emit(FavouriteInitial());
  }
}
