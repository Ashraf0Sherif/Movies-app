import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/favourite_cubit/favourite_cubit.dart';
import 'package:movies_app/cubits/movies_cubit/movies_cubit.dart';
import 'package:movies_app/cubits/nav_bar_cubit/nav_bar_cubit.dart';
import 'package:movies_app/cubits/saved_cubit/saved_cubit.dart';
import 'package:movies_app/pages/bottom_nav_bar.dart';
import 'package:movies_app/simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MoviesCubit()),
        BlocProvider(create: (context) => FavouriteCubit()),
        BlocProvider(create: (context) => SavedCubit()),
        BlocProvider(create: (context) => NavBarCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}
