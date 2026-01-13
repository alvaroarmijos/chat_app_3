import 'package:chat_app_3/app/auth/bloc/auth_bloc.dart';
import 'package:chat_app_3/app/core/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthHandler extends StatelessWidget {
  const AuthHandler({
    super.key,
    required this.child,
    required this.navigatorKey,
  });

  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        return switch (state) {
          AuthStateLoggedIn() => navigatorKey.currentState?.pushNamed(
            AppNavigator.home,
          ),
          AuthStateLoggedOut() => navigatorKey.currentState?.pushNamed(
            AppNavigator.main,
          ),
          AuthStateLoading() || AuthStateUknown() => print('null'),
        };
      },
      child: child,
    );
  }
}
