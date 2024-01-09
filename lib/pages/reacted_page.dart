import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/nav_bar_cubit/nav_bar_cubit.dart';
import 'package:movies_app/pages/saved_page.dart';
import 'favourite_page.dart';

class ReactedPage extends StatelessWidget {
  const ReactedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          if (state is NavBarReactedPage) {
            if (state.list == "favourite") {
              return const FavouritePage();
            } else {
              return const SavedPage();
            }
          }
          //Impossible case
          return Container();
        },
      ),
    );
  }
}
