import 'package:chat_app_3/data/repositories/messages_repository/messages_repository.dart';
import 'package:firebase_database/firebase_database.dart';

class MessagesRepositoryFirebaseImpl implements MessagesRepository {
  final _firebaseDatabase = FirebaseDatabase.instance;

  @override
  Future<void> sendMessage(
    String chatId,
    String message,
    String date,
    String sentBy,
  ) {
    return _firebaseDatabase.ref('chats').child(chatId).push().set({
      'message': message,
      'messageDate': date,
      'sentBy': sentBy,
    });
  }
}
