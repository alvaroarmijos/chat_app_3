import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app_3/data/repositories/auth_repository/auth_repository_firebase_impl.dart';
import 'package:chat_app_3/data/repositories/messages_repository/messages_repository_firebase_impl.dart';
import 'package:chat_app_3/domain/models/message.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState()) {
    on<SendMessageEvent>(_onSendMessageEvent);
  }

  final messagesRepository = MessagesRepositoryFirebaseImpl();
  final authRepository = AuthRepositoryFirebaseImpl();

  FutureOr<void> _onSendMessageEvent(
    SendMessageEvent event,
    Emitter<ChatState> emit,
  ) async {
    final date = DateTime.now().toIso8601String();

    final user = await authRepository.currentUser.first;
    if (user == null) return;

    messagesRepository.sendMessage(
      _getChatId(user.uid, event.contactId),
      event.message,
      date,
      event.contactId,
    );
  }

  String _getChatId(String currentUserId, String contactId) {
    final chatIds = [currentUserId, contactId]..sort();
    // chatIds.sort();
    return '${chatIds[0]}_${chatIds[1]}';
  }
}
