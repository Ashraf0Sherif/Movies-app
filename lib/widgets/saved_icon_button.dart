import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/saved_cubit/saved_cubit.dart';
import '../cubits/movies_cubit/movies_cubit.dart';
import '../models/movie_model.dart';

class SavedIconButton extends StatelessWidget {
  final Movie movie;

  const SavedIconButton({super.key, required this.movie});

  final int duration = 520;

  @override
  Widget build(BuildContext context) {
    final moviesCubit = BlocProvider.of<MoviesCubit>(context);
    final savedCubit = BlocProvider.of<SavedCubit>(context);
    return BlocBuilder<SavedCubit, SavedState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            if (movie.saved == true) {
              moviesCubit.removeSave(movie);
              savedCubit.addSaved();
            } else {
              moviesCubit.addSave(movie);
              savedCubit.remSaved();
            }
          },
          icon: AnimatedSwitcher(
            duration: Duration(milliseconds: duration),
            child: movie.saved == false
                ? const Icon(
                    Icons.bookmark,
                    color: Colors.white,
                    key: ValueKey(1),
                  )
                : const Icon(
                    Icons.bookmark,
                    color: Colors.red,
                    size: 25.8,
                    key: ValueKey(2),
                  ),
          ),
        );
      },
    );
  }
}
