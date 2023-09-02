import 'package:flutter/material.dart';

import 'custom_text.dart';
class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CustomText(text: "Something wrong , try again"));
  }
}