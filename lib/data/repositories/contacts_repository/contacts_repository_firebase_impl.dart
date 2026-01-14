import 'package:chat_app_3/data/repositories/contacts_repository/contacts_repository.dart';
import 'package:chat_app_3/domain/models/contact.dart';
import 'package:firebase_database/firebase_database.dart';

class ContactsRepositoryFirebaseImpl implements ContactsRepository {
  @override
  Stream<List<Contact>> getContacts() {
    return FirebaseDatabase.instance.ref('contacts').onValue.map((event) {
      final value = event.snapshot.value as Map?;
      return value?.values.map((element) {
            return Contact(
              name: element['name'],
              photoUrl: element['photoUrl'],
              status: element['status'],
            );
          }).toList() ??
          [];
    });
  }
}
