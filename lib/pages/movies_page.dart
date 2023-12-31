import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/movies_cubit/movies_cubit.dart';
import 'package:movies_app/widgets/error_message.dart';
import 'package:movies_app/widgets/success_movies_home_body.dart';
import '../constants.dart';
import '../widgets/custom_loading_indecator.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: kLinearGradient),
      child: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (BuildContext context, state) {
          if (state is MoviesLoading) {
            BlocProvider.of<MoviesCubit>(context).fetchAll();
            return const CustomLoadingIndicator();
          } else if (state is MoviesSuccess) {
            return const SuccessHomeBody();
          } else {
            return const ErrorMessage();
          }
        },
      ),
    );
  }
}
