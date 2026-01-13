import 'dart:async';

import 'package:chat_app_3/data/repositories/auth_repository/auth_repository_firebase_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthStateLoading()) {
    on<CheckUserEvent>(_onCheckUserEvent);
  }

  // Implementación temporal
  final authRepository = AuthRepositoryFirebaseImpl();

  FutureOr<void> _onCheckUserEvent(
    CheckUserEvent event,
    Emitter<AuthState> emit,
  ) {
    return emit.forEach(
      authRepository.currentUser,
      onData: (user) {
        if (user == null) {
          return AuthStateLoggedOut();
        } else {
          return AuthStateLoggedIn();
        }
      },
    );
  }
}
