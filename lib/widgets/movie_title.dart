import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

import '../constatns.dart';
class MovieTitle extends StatelessWidget {
  const MovieTitle({
    super.key,
    required this.movieTitle,
  });

  final String movieTitle;

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      padding: const EdgeInsets.all(3),
      blur: 0,
      color: kPrimaryColor.withOpacity(0.3),
      child: Text(
        movieTitle,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
