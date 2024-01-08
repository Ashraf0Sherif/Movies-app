import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/favourite_cubit/favourite_cubit.dart';
import 'package:movies_app/cubits/movies_cubit/movies_cubit.dart';
import 'package:movies_app/cubits/nav_bar_cubit/nav_bar_cubit.dart';
import 'package:movies_app/cubits/saved_cubit/saved_cubit.dart';

import '../constants.dart';
import '../models/movie_model.dart';
import '../widgets/custom_list_view.dart';

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
              return BlocBuilder<FavouriteCubit, FavouriteState>(
                builder: (context, state) {
                  return Container(
                    decoration: const BoxDecoration(gradient: kLinearGradient),
                    child: providerList.isEmpty
                        ? const Center(
                      child: BlurryContainer(
                        color: kPrimaryColor,
                        child: Text(
                          "Add some movies",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    )
                        : ListView(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        CustomListView(list: providerList, height: 420),
                      ],
                    ),
                  );
                },
              );
            }
            else{
              providerList = BlocProvider.of<MoviesCubit>(context).savedMovies;
              return BlocBuilder<SavedCubit, SavedState>(
                builder: (context, state) {
                  return Container(
                    decoration: const BoxDecoration(gradient: kLinearGradient),
                    child: providerList.isEmpty
                        ? const Center(
                      child: BlurryContainer(
                        color: kPrimaryColor,
                        child: Text(
                          "Add some movies",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    )
                        : ListView(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        CustomListView(list: providerList, height: 420),
                      ],
                    ),
                  );
                },
              );
            }
          }
          print("lol");
          return Container();
        },
      ),
    );
  }
}
