import 'package:chat_app_3/widgets/onboarding_divider.dart';
import 'package:chat_app_3/widgets/social_media_bar.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Log in',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF58C3B6).withValues(alpha: 0.7),
                      decorationThickness: 5,
                    ),
                    children: [
                      TextSpan(
                        text: ' to Chateo',
                        style: TextStyle(decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Text(
                    'Welcome back! Sign in using your social account or email to continue us',
                    style: TextStyle(fontSize: 14, color: Color(0xFF797C7B)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SocialMediaBar(appleIconColor: Colors.black),
                OnboardingDivider(
                  textColor: Color(0xFF797C7B),
                  dividerColor: Color(0xFFCDD1D0),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    cursorColor: Color(0xFF24786D),
                    decoration: InputDecoration(
                      labelText: 'Your email',
                      labelStyle: TextStyle(color: Color(0xFF24786D)),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    cursorColor: Color(0xFF24786D),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Color(0xFF24786D)),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF24786D),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Sign up withn mail'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
