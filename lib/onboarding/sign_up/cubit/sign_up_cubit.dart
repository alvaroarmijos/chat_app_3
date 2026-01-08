import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

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

    //final response = await authRepository.signUp();

    // if (response.isSuccess) {
    //   emit(state.copyWith(status: SignUpStatus.success));
    // } else {
    //   emit(state.copyWith(status: SignUpStatus.failure, errorMessage: response.errorMessage));
    // }

    // Enviar esta información al backend o servicio de autenticación (Firebase)
  }
}
