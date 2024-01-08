part of 'nav_bar_cubit.dart';

abstract class NavBarState {}

class NavBarInitial extends NavBarState {}

class NavBarMoviesPage extends NavBarState {}

class NavBarReactedPage extends NavBarState {
  String list;

  NavBarReactedPage({required this.list});
}