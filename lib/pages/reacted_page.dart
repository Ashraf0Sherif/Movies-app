import 'package:flutter/material.dart';
import 'package:movies_app/pages/saved_page.dart';
import 'favourite_page.dart';

class ReactedPage extends StatelessWidget {
  const ReactedPage({super.key, required this.list});

  final String list;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: list == "favourite" ? const FavouritePage() : const SavedPage());
  }
}
