abstract class MessagesRepository {
  // funcion para enviar mensajes y guardar en la base de datos
  Future<void> sendMessage(
    String chatId,
    String message,
    String date,
    String sentBy,
  );
}
