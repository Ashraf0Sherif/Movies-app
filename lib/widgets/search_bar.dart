import 'package:flutter/material.dart';
import '../pages/search_page.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: TextFormField(
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "Field is required";
          }
          return null;
        },
        cursorColor: Colors.red,
        cursorRadius: const Radius.circular(20),
        cursorHeight: 19,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Search for a movie',
          hintStyle: const TextStyle(color: Colors.white60),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.white70),
            borderRadius: BorderRadius.circular(50.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.white70),
            borderRadius: BorderRadius.circular(50.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.white70),
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        onFieldSubmitted: (text) {
          if (_formKey.currentState!.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SearchPage(
                    text: text,
                  );
                },
              ),
            );
          }
          else{
            autovalidateMode = AutovalidateMode.always;
            setState(() {});
          }
        },
      ),
    );
  }
}
