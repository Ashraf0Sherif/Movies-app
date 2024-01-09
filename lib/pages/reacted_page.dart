import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/movies_cubit/movies_cubit.dart';
import 'package:movies_app/cubits/nav_bar_cubit/nav_bar_cubit.dart';
import 'package:movies_app/pages/saved_page.dart';
import '../models/movie_model.dart';
import 'favourite_page.dart';

class ReactedPage extends StatefulWidget {
  const ReactedPage({super.key});

  @override
  State<ReactedPage> createState() => _ReactedPageState();
}

class _ReactedPageState extends State<ReactedPage> {
  @override
  Widget build(BuildContext context) {
    List<Movie> providerList = [];
    return SafeArea(
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          if (state is NavBarReactedPage) {
            if (state.list == "favourite") {
              providerList = BlocProvider.of<MoviesCubit>(context).favMovies;
              return const FavouritePage();
            } else {
              providerList = BlocProvider.of<MoviesCubit>(context).savedMovies;
              return SavedPage(providerList: providerList);
            }
          }
          //Impossible case
          return Container();
        },
      ),
    );
  }
}
