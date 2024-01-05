import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/movies_cubit/movies_cubit.dart';

import '../constatns.dart';
import '../models/movie_model.dart';
import '../widgets/custom_list_view.dart';

class ReactedPage extends StatelessWidget {
  final String list;

  const ReactedPage({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    final List<Movie> providerList;
    if (list == "favourite") {
      providerList = BlocProvider.of<MoviesCubit>(context).favMovies;
    } else {
      providerList = BlocProvider.of<MoviesCubit>(context).savedMovies;
    }
    return SafeArea(
      child: Container(
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
      ),
    );
  }
}
