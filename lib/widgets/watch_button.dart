import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/movie_model.dart';

class WatchButton extends StatelessWidget {
  const WatchButton({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            disabledBackgroundColor: Colors.grey,
            disabledForegroundColor: Colors.white),
        onPressed:
            (movie.link != "" && movie.available == true && movie.link != null)
                ? () {
                    launchUrl(Uri.parse(movie.link),
                        mode: LaunchMode.externalApplication);
                  }
                : null,
        child: Text((movie.link != "" && movie.available == true&& movie.link != null)
            ? "Watch Now"
            : "Coming Soon"),
      ),
    );
  }
}
