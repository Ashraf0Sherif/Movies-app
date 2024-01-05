import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/movies_cubit/movies_cubit.dart';

import '../models/movie_model.dart';

class FavouriteIconButton extends StatefulWidget {
  final Movie movie;

  const FavouriteIconButton({super.key, required this.movie});

  @override
  State<FavouriteIconButton> createState() => _FavouriteIconButtonState();
}

class _FavouriteIconButtonState extends State<FavouriteIconButton> {
  final int duration = 520;

  @override
  Widget build(BuildContext context) {
    final moviesCubit = BlocProvider.of<MoviesCubit>(context);
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (widget.movie.isFav == true) {
              setState(() {
                if (widget.movie.popularity != null) {
                  widget.movie.popularity--;
                }
                moviesCubit.removeFav(widget.movie);
              });
            } else {
              setState(() {
                if (widget.movie.popularity != null) {
                  widget.movie.popularity++;
                }
                moviesCubit.addFav(widget.movie);
              });
            }
          },
          icon: AnimatedSwitcher(
            duration: Duration(milliseconds: duration),
            child: widget.movie.isFav == true
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 25.8,
                    key: ValueKey(1),
                  )
                : const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
          ),
        ),
        Text(
          "${widget.movie.popularity?.toInt()}   ",
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
