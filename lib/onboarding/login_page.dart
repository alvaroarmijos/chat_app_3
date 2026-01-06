import 'package:chat_app_3/widgets/onboarding_divider.dart';
import 'package:chat_app_3/widgets/social_media_bar.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Form(
                key: formKey,
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Log in',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(
                            0xFF58C3B6,
                          ).withValues(alpha: 0.7),
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
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text(
                        'Welcome back! Sign in using your social account or email to continue us',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF797C7B),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SocialMediaBar(appleIconColor: Colors.black),
                    const SizedBox(height: 20),
                    OnboardingDivider(
                      textColor: Color(0xFF797C7B),
                      dividerColor: Color(0xFFCDD1D0),
                    ),
                    TextFormField(
                      cursorColor: Color(0xFF24786D),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Your email',
                        labelStyle: TextStyle(
                          color: Color(0xFF24786D),
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFD6E4E0)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFD6E4E0)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFD6E4E0)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }

                        final emailRegex = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        );

                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      cursorColor: Color(0xFF24786D),
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Color(0xFF24786D),
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFD6E4E0)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFD6E4E0)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFD6E4E0)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters long';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentGeometry.bottomCenter,
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF24786D),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      final isValid = formKey.currentState?.validate();

                      if (isValid ?? false) {
                        print('Formulario válido');
                      } else {
                        print('Formulario inválido');
                      }
                    },
                    child: Text('Sign up withn mail'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
