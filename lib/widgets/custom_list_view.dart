import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/movie_model.dart';
import 'movie_item_horizontal.dart';

class CustomListView extends StatelessWidget {
  final List<Movie> list;
  final double height;

  const CustomListView({super.key, required this.list, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieItemHorizontal(
            movie: list[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const VerticalDivider(
            thickness: 1.5,
            indent: 60,
            endIndent: 60,
            color: kPrimaryColor,
          );
        },
      ),
    );
  }
}
