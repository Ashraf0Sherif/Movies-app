import 'package:bloc/bloc.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial());

  void getPage({required int index}) {
    if (index == 0) {
      emit(NavBarMoviesPage());
    } else if (index == 1) {
      emit(NavBarReactedPage(list: "favourite"));
    } else {
      emit(NavBarReactedPage(list: "saved"));
    }
  }
}
