import 'package:chat_app_3/data/repositories/auth_repository/auth_repository_firebase_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

  // Implementación temporal
  final authRepository = AuthRepositoryFirebaseImpl();

  void onNameChanged(String? name) {
    emit(state.copyWith(name: name));
  }

  void onEmailChanged(String? email) {
    emit(state.copyWith(email: email));
  }

  void onPasswordChanged(String? password) {
    emit(state.copyWith(password: password));
  }

  void onConfirmPasswordChanged(String? confirmPassword) {
    emit(state.copyWith(confirmPassword: confirmPassword));
  }

  void signUp() {
    // Lógica para registrarse
    print("Name: ${state.name}");
    print("Email: ${state.email}");
    print("Password: ${state.password}");
    print("Confirm Password: ${state.confirmPassword}");

    final name = state.name;
    final email = state.email;
    final password = state.password;

    if (name == null || email == null || password == null) return;

    authRepository.signUp(name, email, password);
  }
}
