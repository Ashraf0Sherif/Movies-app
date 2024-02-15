import 'package:flutter/material.dart';

class CustomAuthText extends StatelessWidget {
  const CustomAuthText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 14, color: Colors.white),
    );
  }
}
