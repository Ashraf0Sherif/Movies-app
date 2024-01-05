import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/movies_cubit/movies_cubit.dart';
import '../models/movie_model.dart';

class SavedIconButton extends StatefulWidget {
  final Movie movie;

  const SavedIconButton({super.key, required this.movie});

  @override
  State<SavedIconButton> createState() => _SavedIconButtonState();
}

class _SavedIconButtonState extends State<SavedIconButton> {
  final int duration = 520;

  @override
  Widget build(BuildContext context) {
    final cubitProvider = BlocProvider.of<MoviesCubit>(context);
    return IconButton(
      onPressed: () {
        if (widget.movie.saved == false) {
          setState(() {
            widget.movie.saved = true;
            cubitProvider.addSave(widget.movie);
          });
        } else {
          setState(() {
            widget.movie.saved = false;
            cubitProvider.removeSave(widget.movie);
          });
        }
      },
      icon: AnimatedSwitcher(
        duration: Duration(milliseconds: duration),
        child: widget.movie.saved == false
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
  }
}
