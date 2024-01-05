import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/widgets/search_bar.dart';
import '../cubits/movies_cubit/movies_cubit.dart';
import 'custom_list_view.dart';
import 'custom_text.dart';

class SuccessHomeBody extends StatelessWidget {
  const SuccessHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubitProvider = BlocProvider.of<MoviesCubit>(context);
    const double height = 360;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: CustomSearchBar(),
          ),
          CustomText(text: 'Trending'),
          CustomListView(list: cubitProvider.trendingMovies, height: height),
          const SizedBox(
            height: 20,
          ),
          CustomText(text: 'Popular'),
          CustomListView(list: cubitProvider.popularMovies, height: height),
          const SizedBox(
            height: 20,
          ),
          CustomText(text: 'Top Rated'),
          CustomListView(list: cubitProvider.topRated, height: height),
          const SizedBox(
            height: 20,
          ),
          CustomText(text: 'Up Coming'),
          CustomListView(list: cubitProvider.upComingMovies, height: height),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
