import 'package:chat_app_3/data/repositories/auth_repository/auth_repository_firebase_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class OnboardingCubit extends Cubit<void> {
  OnboardingCubit() : super(());

  // Implementación temporal
  final authRepository = AuthRepositoryFirebaseImpl();

  void signUnWithGoogle() async {
    try {
      await authRepository.signInWithGoogle();
    } on GoogleSignInException catch (error) {
      print(error.details);
      print(error.description);
    } catch (e) {
      print(e);
    }
  }
}
