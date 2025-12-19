import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_app_3/onboarding/login_page.dart';
import 'package:chat_app_3/onboarding/sign_up_page.dart';
import 'package:chat_app_3/widgets/onboarding_divider.dart';
import 'package:chat_app_3/widgets/social_media_bar.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/icons/icon_app.png'),
                  AutoSizeText(
                    'Connect friends easily & quickly',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 68,
                    ),
                    maxLines: 3,
                  ),
                  Text(
                    'Our chat app is the perfect way to stay connected with friends and family.',
                    style: TextStyle(fontSize: 16, color: Color(0xFFB9C1BE)),
                  ),
                  SocialMediaBar(),
                  OnboardingDivider(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: Text('Sign up withn mail'),
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Textyle: TextStyle(
                  //         fontSize: 14,
                  //         color: Color(0xFFB9C1BE),
                  //       ),
                  //     ),
                  //     GestureDetector(
                  //       child: Text(
                  //         'Log in',
                  //         style: TextStyle(
                  //           fontSize: 14,
                  //           color: Colors.white,
                  //           fontWt(
                  //       'Existing account? ',
                  //       seight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Existing account? ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFB9C1BE),
                        ),
                        children: [
                          TextSpan(
                            text: 'Log in',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
