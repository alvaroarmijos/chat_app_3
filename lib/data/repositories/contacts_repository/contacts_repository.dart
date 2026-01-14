import 'package:chat_app_3/domain/models/contact.dart';

abstract class ContactsRepository {
  // Obtener la lista de contactos
  Stream<List<Contact>> getContacts();
}
