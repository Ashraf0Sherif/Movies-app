import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';

import '../models/movie_model.dart';

class MovieStatus extends StatelessWidget {
  const MovieStatus({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlurryContainer(
          color: kPrimaryColor,
          child: Text(
            movie.releaseDate == null
                ? "Still not released"
                : movie.releaseDate!,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const Spacer(),
        BlurryContainer(
          color: kPrimaryColor,
          child: Text(
            movie.status ?? "In Production",
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const Spacer(
          flex: 3,
        )
      ],
    );
  }
}
