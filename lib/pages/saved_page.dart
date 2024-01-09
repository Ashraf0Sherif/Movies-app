import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';
import '../cubits/saved_cubit/saved_cubit.dart';
import '../models/movie_model.dart';
import '../widgets/custom_list_view.dart';
class SavedPage extends StatelessWidget {
  const SavedPage({
    super.key,
    required this.providerList,
  });

  final List<Movie> providerList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedCubit, SavedState>(
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(gradient: kLinearGradient),
          child: providerList.isEmpty
              ? const Center(
            child: BlurryContainer(
              color: kPrimaryColor,
              child: Text(
                "Add some movies",
                style: TextStyle(
                    color: Colors.white, fontSize: 20),
              ),
            ),
          )
              : ListView(
            children: [
              const SizedBox(
                height: 40,
              ),
              CustomListView(list: providerList, height: 420),
            ],
          ),
        );
      },
    );
  }
}