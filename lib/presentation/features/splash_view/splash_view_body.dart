import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../resources/app_router.dart';
import '../../resources/assets_manger.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        GoRouter.of(context).pushReplacement(AppRouter.kOnBoarding);
      },
    );
  }

  @override
  void initState() {
    super.initState();

    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(ImageAssets.splashLogo),
    );
  }
}
