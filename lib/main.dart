import 'package:chat_app_3/app/core/ui/ui.dart';
import 'package:chat_app_3/firebase_options.dart';
import 'package:chat_app_3/login/view/login_page.dart';
import 'package:chat_app_3/onboarding/sign_up/cubit/sign_up_cubit.dart';
import 'package:chat_app_3/onboarding/sign_up/view/sign_up_page.dart';
import 'package:chat_app_3/onboarding/view/onboarding_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: MaterialApp(
        theme: AppTheme.light,
        title: 'Material App',
        routes: {
          AppNavigator.main: (context) => const OnboardingPage(),
          AppNavigator.login: (context) => const LoginPage(),
          AppNavigator.signUp: (context) => const SignUpPage(),
        },
      ),
    );
  }
}
