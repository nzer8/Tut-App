import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.onTab, required this.text, this.textStyle});

  final void Function()? onTab;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTab,
        child: Text(
          text,
          style: textStyle,
        ));
  }
}
