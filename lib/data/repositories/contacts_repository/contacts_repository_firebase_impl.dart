import 'package:chat_app_3/data/repositories/contacts_repository/contacts_repository.dart';
import 'package:chat_app_3/domain/models/contact.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class ContactsRepositoryFirebaseImpl implements ContactsRepository {
  final _firebaseDatabase = FirebaseDatabase.instance;

  @override
  Stream<List<Contact>> getContacts() {
    return _firebaseDatabase.ref('contacts').onValue.map((event) {
      final value = event.snapshot.value as Map?;
      return value?.values.map((element) {
            return Contact(
              name: element['name'],
              photoUrl: element['photoUrl'],
              status: element['status'],
              id: element['id'],
            );
          }).toList() ??
          [];
    });
  }

  @override
  Future<void> updateUser(User user, bool status) {
    return _firebaseDatabase.ref('contacts').child(user.uid).update({
      'name': user.displayName,
      'photoUrl': user.photoURL,
      'status': status,
    });
  }
}
