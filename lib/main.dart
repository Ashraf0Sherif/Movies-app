import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/pages/login_page.dart';
import 'package:movies_app/simple_bloc_observer.dart';

import 'business_logic/cubits/favourite_cubit/favourite_cubit.dart';
import 'business_logic/cubits/movies_cubit/movies_cubit.dart';
import 'business_logic/cubits/nav_bar_cubit/nav_bar_cubit.dart';
import 'business_logic/cubits/saved_cubit/saved_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: LoginView(),
    );
  }
}
