import 'package:chat_app_3/data/repositories/auth_repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepository) : super(SignUpState());

  final AuthRepository authRepository;

  void onNameChanged(String? name) {
    emit(state.copyWith(name: name));
  }

  void onEmailChanged(String? email) {
    print(state.status);
    emit(state.copyWith(email: email));
  }

  void onPasswordChanged(String? password) {
    emit(state.copyWith(password: password));
  }

  void onConfirmPasswordChanged(String? confirmPassword) {
    emit(state.copyWith(confirmPassword: confirmPassword));
  }

  void signUp() async {
    // Lógica para registrarse
    print("Name: ${state.name}");
    print("Email: ${state.email}");
    print("Password: ${state.password}");
    print("Confirm Password: ${state.confirmPassword}");

    final name = state.name;
    final email = state.email;
    final password = state.password;

    if (name == null || email == null || password == null) return;

    try {
      emit(state.copyWith(status: Status.loading));

      await authRepository.signUp(name, email, password);

      emit(state.copyWith(status: Status.success));
    } on FirebaseAuthException catch (error) {
      // if (error.code == 'email-already-in-use') {
      //   emit(state.copyWith(status: Status.emailAlreadyRegistered));
      // } else if (error.code == 'invalid-email') {
      //   emit(state.copyWith(status: Status.invalidEmail));
      // } else if (error.code == 'too-many-requests') {
      //   emit(state.copyWith(status: Status.tooManyRequests));
      // } else {
      //   emit(state.copyWith(status: Status.failed));
      // }
      switch (error.code) {
        case 'email-already-in-use':
          emit(
            state.copyWith(
              status: Status.emailAlreadyRegistered,
              message: error.message,
            ),
          );
          break;
        case 'invalid-email':
          emit(
            state.copyWith(status: Status.invalidEmail, message: error.message),
          );
          break;
        case 'too-many-requests':
          emit(
            state.copyWith(
              status: Status.tooManyRequests,
              message: error.message,
            ),
          );
          break;
        default:
          emit(
            state.copyWith(
              status: Status.failed,
              message: 'Firebase exception. Try again.',
            ),
          );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: Status.failed,
          message: 'Network exception. Try again.',
        ),
      );
    }
  }
}
