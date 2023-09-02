import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/movie_model.dart';
import '../providers/movie_provider.dart';
class SavedIconButton extends StatelessWidget {
  final Movie movie;
  const SavedIconButton({super.key,required this.movie});
  final int duration=520;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);
    return IconButton(
      onPressed: () {
        if (movie.saved == false) {
          movie.saved = true;
          provider.addSave(movie);
        } else {
          movie.saved = false;
          provider.removeSave(movie);
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
  }
}
