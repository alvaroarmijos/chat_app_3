import 'package:chat_app_3/domain/models/contact.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ContactsRepository {
  // Obtener la lista de contactos
  Stream<List<Contact>> getContacts();

  // Actualizar la información del usuario en la base de datos
  Future<void> updateUser(User user, bool status, String? token);
}
