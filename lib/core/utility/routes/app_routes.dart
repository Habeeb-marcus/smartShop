import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smart_shop/core/utility/dialog_helper/dialog_manager.dart';
import 'package:smart_shop/presentation/views/authentication/forgot_password.dart';
import 'package:smart_shop/presentation/views/authentication/home_screen.dart';
import 'package:smart_shop/presentation/views/authentication/onboarding/onboarding_view.dart';
import 'package:smart_shop/presentation/views/authentication/sign_in/sign_In.dart';
import 'package:smart_shop/presentation/views/authentication/sign_up/sign_up.dart';


class AppRoutes {
  static const String loginRoute = "SignIn";
  static const String forgotPasswordRoute = "ForgotPassword";
  static const String signUpRoute = "SignUp";
  static const String homeRoute = "HomeScreen";
  static const String onboardingRoute = "OnboardingView";



  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const HomeScreen(),
        );

      case onboardingRoute:
        return _getTransitionPageRoute(
          type: PageTransitionType.bottomToTop,
          routeName: settings.name!,
          viewToShow: const OnboardingView(),
        );
      case loginRoute:
        return _getTransitionPageRoute(
          type: PageTransitionType.bottomToTop,
          routeName: settings.name!,
          viewToShow: const SignIn(),
        );

      case signUpRoute:
        return _getTransitionPageRoute(
          type: PageTransitionType.rightToLeft,
          routeName: settings.name!,
          viewToShow: const SignUp(),
        );

      case forgotPasswordRoute:
        return _getTransitionPageRoute(
          type: PageTransitionType.rightToLeft,
          routeName: settings.name!,
          viewToShow: const ForgotPassword(),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }

  PageRoute _getPageRoute(
      {required String routeName, required Widget viewToShow}) {
    return MaterialPageRoute(
        settings: RouteSettings(
          name: routeName,
        ),
        builder: (_) => DialogManager(child: viewToShow));
  }

  PageRoute _getTransitionPageRoute({
    required String routeName,
    required Widget viewToShow,
    PageTransitionType type = PageTransitionType.bottomToTop,
  }) {
    return PageTransition(
        settings: RouteSettings(
          name: routeName,
        ),
        type: type,
        child: DialogManager(child: viewToShow));
  }
}
