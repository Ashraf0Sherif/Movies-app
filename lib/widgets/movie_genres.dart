import 'package:flutter/material.dart';

class MovieGenres extends StatelessWidget {
  const MovieGenres({
    super.key,
    required this.genres,
  });

  final List<String> genres;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: genres.map((e) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
            child: Container(
              padding: const EdgeInsets.all(1.5),
              decoration: BoxDecoration(
                  color: const Color(0xff262A34),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                e,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold),
              ),
            ));
      }).toList(),
    );
  }
}
