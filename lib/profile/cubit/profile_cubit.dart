import 'package:bloc/bloc.dart';
import 'package:chat_app_3/data/repositories/auth_repository/auth_repository.dart';
import 'package:chat_app_3/data/repositories/contacts_repository/contacts_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.authRepository, this.contactsRepository)
    : super(ProfileStateLoading()) {
    initialize();
  }
  final AuthRepository authRepository;
  final ContactsRepository contactsRepository;

  void initialize() async {
    final user = await authRepository.currentUser.first;
    if (user != null) {
      emit(ProfileStateLoggedIn(user: user));
    }
  }

  Future<void> logOut() async {
    final state = this.state;
    if (state is ProfileStateLoggedIn) {
      await Future.wait([
        contactsRepository.updateUser(state.user, false, null),
        authRepository.logOut(),
      ]);
    }
  }
}
