import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  // metodo para registrar usuario
  Future<void> signUp(String name, String email, String password);

  // metodo para loguear usuario
  Future<void> login(String email, String password);

  // metodo para cerrar sesion
  Future<void> logOut();

  // metodo para obtener el usuario actual
  Stream<User?> get currentUser;

  // metodo para loguear con Google
  Future<void> signInWithGoogle();

  // metodo para loguear con Facebook

  // metodo para loguear con Apple
}
