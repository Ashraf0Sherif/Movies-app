import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

import '../models/movie_model.dart';
class MovieStatus extends StatelessWidget {
  const MovieStatus({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlurryContainer(
            color: const Color(0xff262A34),
            child: Text(
              movie.releaseDate == ""
                  ? "Still not released"
                  : movie.releaseDate!,
              style: const TextStyle(color: Colors.white),
            )),
        const Spacer(),
        BlurryContainer(
            color: const Color(0xff262A34),
            child: Text(
              "${movie.status}",
              style: const TextStyle(color: Colors.white),
            )),
        const Spacer()
      ],
    );
  }
}