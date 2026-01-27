import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app_3/data/repositories/auth_repository/auth_repository.dart';
import 'package:chat_app_3/data/repositories/messages_repository/messages_repository.dart';
import 'package:chat_app_3/domain/models/message.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(this.messagesRepository, this.authRepository) : super(ChatState()) {
    on<SendMessageEvent>(_onSendMessageEvent);
    on<GetMessagesEvent>(_onGetMessagesEvent);
  }

  final MessagesRepository messagesRepository;
  final AuthRepository authRepository;

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
      user.uid,
      event.contactId,
    );
  }

  String _getChatId(String currentUserId, String contactId) {
    final chatIds = [currentUserId, contactId]..sort();
    // chatIds.sort();
    return '${chatIds[0]}_${chatIds[1]}';
  }

  FutureOr<void> _onGetMessagesEvent(
    GetMessagesEvent event,
    Emitter<ChatState> emit,
  ) async {
    final user = await authRepository.currentUser.first;
    if (user == null) return;

    final chatId = _getChatId(user.uid, event.contactId);

    return emit.forEach(
      messagesRepository.getMessages(chatId),
      onData: (messages) {
        return ChatState(messages: messages);
      },
    );
  }
}
