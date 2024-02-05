import 'package:flutter/material.dart';

import '../resources/color_manger.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.textError,
    this.textInputType,
    required this.textEditingController,
    required this.isObscureText,
    required this.hintText,
    required this.stream,
  }) : super(key: key);

  final Stream<bool> stream;
  final String textError;
  final TextInputType? textInputType;
  final TextEditingController textEditingController;
  final bool isObscureText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: stream,
        builder: (context, snapshot) {
          return TextFormField(
            style: TextStyle(
              color: ColorManger.primaryColor,
              fontWeight: FontWeight.bold,
            ),
            controller: textEditingController,
            keyboardType: textInputType,
            obscureText: isObscureText,
            decoration: InputDecoration(
              hintText: hintText,
              errorText: (snapshot.data ?? true) ? null : textError,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          );
        });
  }
} /*
errorText: (snapshot.data ?? true)
//errorText يعني مافي  null واذا رحع  null  يعني لو في داتا رحع
? null
    : AppString.passwordError,*/
