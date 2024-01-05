import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../models/movie_model.dart';
class VotingBar extends StatelessWidget {
  const VotingBar({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: const Color(0xff1A202C).withOpacity(0.4),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "Voting average : ${movie.voteAverage != null ? movie.voteAverage.toInt() : "Unknown"}",
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.symmetric(vertical: 7, horizontal: 50),
          child: LinearPercentIndicator(
            animationDuration: 600,
            animation: true,
            lineHeight: 2,
            percent: movie.voteAverage != null
                ? movie.voteAverage.ceil() / 10
                : 0,
            progressColor: const Color(0xff21D07A),
          ),
        ),
      ],
    );
  }
}