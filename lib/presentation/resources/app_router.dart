import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tut_app/presentation/features/forget_password/view/forget_password_view.dart';
import 'package:tut_app/presentation/features/home/home_view.dart';
import 'package:tut_app/presentation/features/login_view/view/login_screen.dart';
import 'package:tut_app/presentation/features/splash_view/splash_view.dart';

import '../../app/di.dart';
import '../features/on_boarding_view/view/on_boarding.dart';

abstract class AppRouter {
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static const kForgetPasswordView = '/forgetPasswordView';
  static const kHomeView = '/homeView';
  static const kOnBoarding = '/onBoarding';
  //static const kHomeView = '/homeView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/homeView',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/onBoarding',
        builder: (context, state) => const OnBoarding(),
      ),
      GoRoute(
        path: '/forgetPasswordView',
        builder: (context, state) => const ForgetPassword(),
      ),
      GoRoute(
        path: '/loginView',
        builder: (context, state) {
          initLoginModule();
          return const LoginScreen();
        },
        pageBuilder: (_, state) {
          return CustomSlideTransition(
            key: state.pageKey,
            child: const LoginScreen(),
          );
        },
      ),
    ],
  );
}

class CustomSlideTransition extends CustomTransitionPage<void> {
  CustomSlideTransition({super.key, required super.child})
      : super(
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (_, animation, __, child) {
            return ScaleTransition(
              scale: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
              child: child,
            );
          },
        );
}

// بشكل دائري
/*class CustomSlideTransition extends CustomTransitionPage<void> {
  CustomSlideTransition({super.key, required super.child})
      : super(
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (_, animation, __, child) {
            return RotationTransition(
              turns: animation,
              child: child,
            );
          },
        );
}*/
