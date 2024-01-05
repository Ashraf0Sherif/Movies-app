import 'package:flutter/material.dart';

import '../pages/search_page.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.red,
      cursorRadius: const Radius.circular(20),
      cursorHeight: 19,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Search for a movie',
        hintStyle: const TextStyle(color: Colors.white60),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(50.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.white70),
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      onFieldSubmitted: (text) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SearchPage(
            text: text,
          );
        }));
      },
    );
  }
}
