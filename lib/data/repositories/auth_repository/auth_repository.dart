abstract class AuthRepository {
  // metodo para registrar usuario
  Future<void> signUp(String name, String email, String password);

  // metodo para loguear usuario
  Future<void> login(String email, String password);

  // metodo para cerrar sesion

  // metodo para obtener el usuario actual

  // metodo para loguear con Google

  // metodo para loguear con Facebook

  // metodo para loguear con Apple
}
