import 'package:final_tourism_and_cultural_area_app/routes/app_routes/app_routes.dart';
import 'package:final_tourism_and_cultural_area_app/screens/authentication/login_screen.dart';
import 'package:final_tourism_and_cultural_area_app/screens/authentication/signup_screen.dart';
import 'package:final_tourism_and_cultural_area_app/screens/discover_screen/discover_screen.dart';
import 'package:final_tourism_and_cultural_area_app/screens/home_screen/home_screen.dart';
import 'package:final_tourism_and_cultural_area_app/screens/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login_screen,
      routes: {
        AppRoutes.onboarding_screen: (context) => const OnboardingScreen(),
        AppRoutes.homescreen: (context) => const HomeScreen(),
        AppRoutes.signup_screen: (context) => const SignupScreen(),
        AppRoutes.discover: (context) => const DiscoverScreen(),
        AppRoutes.login_screen: (context) => const LoginScreen(),
      },
    );
  }
}
