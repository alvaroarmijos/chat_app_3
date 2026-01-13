import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_app_3/app/core/ui/ui.dart';
import 'package:chat_app_3/app/core/widgets/onboarding_divider.dart';
import 'package:chat_app_3/app/core/widgets/social_media_bar.dart';
import 'package:chat_app_3/onboarding/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: const OnboardingView(),
    );
  }
}

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            AppDrawables.background,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppDrawables.iconApp),
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
                    style: TextStyle(fontSize: 16, color: AppColors.textColor),
                  ),
                  SocialMediaBar(),
                  OnboardingDivider(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButtonTheme(
                      data: ElevatedButtonThemeData(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppNavigator.signUp);
                        },
                        child: Text('Sign up withn mail'),
                      ),
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
                      Navigator.pushNamed(context, AppNavigator.login);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Existing account? ',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textColor,
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
