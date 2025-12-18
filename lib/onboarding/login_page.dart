import 'package:chat_app_3/widgets/onboarding_divider.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [OnboardingDivider(textColor: Color(0xFF797C7B))]),
    );
  }
}
