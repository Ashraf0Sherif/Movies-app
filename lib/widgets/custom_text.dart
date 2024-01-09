import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  const CustomText({super.key,required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, bottom: 4, top: 14),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.transparent,
          shadows: [
            Shadow(offset: Offset(0, -8), color: Colors.white)
          ], // Step 3 SEE HERE
          decoration: TextDecoration.underline,
          decorationColor: Colors.white,
        ),
      ),
    );
  }
}
