import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/movies_cubit/movies_cubit.dart';
import '../constants.dart';
import '../cubits/favourite_cubit/favourite_cubit.dart';
import '../models/movie_model.dart';
import '../widgets/custom_list_view.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final List<Movie> providerList=BlocProvider.of<MoviesCubit>(context).favMovies;
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
}
