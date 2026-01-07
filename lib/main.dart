import 'package:chat_app_3/app/core/ui/ui.dart';
import 'package:chat_app_3/login/view/login_page.dart';
import 'package:chat_app_3/onboarding/view/onboarding_page.dart';
import 'package:chat_app_3/sign_up/view/sign_up_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      title: 'Material App',
      routes: {
        AppNavigator.main: (context) => const OnboardingPage(),
        AppNavigator.login: (context) => const LoginPage(),
        AppNavigator.signUp: (context) => const SignUpPage(),
      },
    );
  }
}
