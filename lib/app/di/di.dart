// This is our global ServiceLocator
import 'package:chat_app_3/data/repositories/auth_repository/auth_repository.dart';
import 'package:chat_app_3/data/repositories/auth_repository/auth_repository_firebase_impl.dart';
import 'package:chat_app_3/data/repositories/contacts_repository/contacts_repository.dart';
import 'package:chat_app_3/data/repositories/contacts_repository/contacts_repository_firebase_impl.dart';
import 'package:chat_app_3/data/repositories/messages_repository/messages_repository.dart';
import 'package:chat_app_3/data/repositories/messages_repository/messages_repository_firebase_impl.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupDI() {
  getIt.registerSingleton<AuthRepository>(AuthRepositoryFirebaseImpl());
  getIt.registerSingleton<ContactsRepository>(ContactsRepositoryFirebaseImpl());
  getIt.registerSingleton<MessagesRepository>(MessagesRepositoryFirebaseImpl());
}
