import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app_3/data/repositories/auth_repository/auth_repository.dart';
import 'package:chat_app_3/data/repositories/contacts_repository/contacts_repository.dart';
import 'package:chat_app_3/domain/models/contact.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.contactsRepository, this.authRepository) : super(HomeState()) {
    on<GetContactsEvent>(_onGetContactsEvent);
    on<UpdateUserStatus>(_onUpdateUserStatus);
  }

  // Impl Temporal
  final ContactsRepository contactsRepository;
  final AuthRepository authRepository;

  FutureOr<void> _onGetContactsEvent(
    GetContactsEvent event,
    Emitter<HomeState> emit,
  ) {
    return emit.forEach(
      contactsRepository.getContacts(),
      onData: (contacts) {
        return HomeState(contacts: contacts);
      },
    );
  }

  FutureOr<void> _onUpdateUserStatus(
    UpdateUserStatus event,
    Emitter<HomeState> emit,
  ) async {
    final user = await authRepository.currentUser.first;

    if (user == null) return;

    final token = await FirebaseMessaging.instance.getToken();

    contactsRepository.updateUser(user, event.status, token);
  }
}
