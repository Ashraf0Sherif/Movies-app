import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/cubits/search_cubit/search_cubit.dart';
import 'package:movies_app/widgets/movie_item_vertical.dart';
import '../widgets/error_message.dart';

class SearchPage extends StatelessWidget {
  final String? text;

  const SearchPage({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<SearchCubit>(context);
    searchCubit.toInitial();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Results of : ${text!}"),
          backgroundColor: const Color(0xff0F1116),
        ),
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchInitial) {
              searchCubit.fetchData(text: text!);
              return Container(
                decoration: const BoxDecoration(gradient: kLinearGradient),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ),
              );
            } else if (state is SearchLoading) {
              return Container(
                decoration: const BoxDecoration(gradient: kLinearGradient),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ),
              );
            } else if (state is SearchFailure) {
              return Container(
                  decoration: const BoxDecoration(gradient: kLinearGradient),
                  child: const ErrorMessage());
            } else {
              return Container(
                decoration: const BoxDecoration(gradient: kLinearGradient),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, int index) {
                    return MovieItemVertical(
                        movie: searchCubit.displayedMovies[index]);
                  },
                  itemCount: searchCubit.displayedMovies.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 1,
                      thickness: 1.5,
                      indent: 60,
                      endIndent: 60,
                      color: kPrimaryColor,
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
