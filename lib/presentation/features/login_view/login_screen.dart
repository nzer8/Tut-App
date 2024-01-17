import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../resources/color_manger.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManger.white,
          statusBarBrightness: Brightness.dark,
        ),
      ),
    );
  }
}
