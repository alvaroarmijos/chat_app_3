import 'package:chat_app_3/app/core/ui/theme.dart';
import 'package:chat_app_3/onboarding/view/onboarding_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      title: 'Material App',
      home: OnboardingPage(),
    );
  }
}
