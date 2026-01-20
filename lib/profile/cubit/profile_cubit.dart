import 'package:bloc/bloc.dart';
import 'package:chat_app_3/data/repositories/auth_repository/auth_repository_firebase_impl.dart';
import 'package:chat_app_3/data/repositories/contacts_repository/contacts_repository_firebase_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileStateLoading()) {
    initialize();
  }
  final _authRepository = AuthRepositoryFirebaseImpl();
  final _contactsRepository = ContactsRepositoryFirebaseImpl();

  void initialize() async {
    final user = await _authRepository.currentUser.first;
    if (user != null) {
      emit(ProfileStateLoggedIn(user: user));
    }
  }

  Future<void> logOut() async {
    final state = this.state;
    if (state is ProfileStateLoggedIn) {
      await Future.wait([
        _contactsRepository.updateUser(state.user, false),
        _authRepository.logOut(),
      ]);
    }
  }
}
