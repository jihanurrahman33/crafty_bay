import 'package:crafty_bay/features/auth/ui/screens/login_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    late final Widget screenWidget;

    if (settings.name == SplashScreen.name) {
      screenWidget = SplashScreen();
    }
    if (settings.name == LoginScreen.name) {
      screenWidget = LoginScreen();
    }
    if (settings.name == SignUpScreen.name) {
      screenWidget = SignUpScreen();
    }

    return MaterialPageRoute(builder: (context) => screenWidget);
  }
}
