import 'package:flutter/material.dart';
import 'package:tut_app/presentation/features/splash_view/splash_view_body.dart';

import '../../resources/color_manger.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorManger.primaryColor,
        elevation: 0,
      ),
      body: const SplashViewBody(),
    );
  }
}
