import 'package:flutter/material.dart';

import '../constatns.dart';
class CustomLoadingIndecator extends StatelessWidget {
  const CustomLoadingIndecator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: kLinearGradient),
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      ),
    );
  }
}

