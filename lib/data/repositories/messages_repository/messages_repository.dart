import 'package:chat_app_3/domain/models/message.dart';

abstract class MessagesRepository {
  // funcion para enviar mensajes y guardar en la base de datos
  Future<void> sendMessage(
    String chatId,
    String message,
    String date,
    String sentBy,
    String sentTo,
  );

  // funcion para obtener los mensajes de un chat
  Stream<List<Message>> getMessages(String chatId);
}
