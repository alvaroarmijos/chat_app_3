part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthStateLoading extends AuthState {}

final class AuthStateLoggedIn extends AuthState {
  final User user;

  AuthStateLoggedIn({required this.user});
}

final class AuthStateLoggedOut extends AuthState {}

final class AuthStateUknown extends AuthState {}

extension AuthStateExtension on AuthState {
  User? getUser() {
    if (this is AuthStateLoggedIn) return (this as AuthStateLoggedIn).user;
    return null;
  }
}
