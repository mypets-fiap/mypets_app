import 'package:mypets/util/authentication.dart';

class LoginService {
  Future<bool> entrar(String email, String pass) async {
    print("Entrando...");

    bool sucesso = false;

    await AuthenticationHelper().signIn(email: email, password: pass).then(
          (value) => {
            if (value == null)
              {
                sucesso = true,
              }
            else
              {
                sucesso = false,
              }
          },
        );
    return sucesso;
  }

  Future<bool> novoUsuario(String email, String pass) async {
    bool sucesso = false;
    await AuthenticationHelper().signUp(email: email, password: pass).then(
          (value) => {
            if (value == null)
              {
                sucesso = true,
              }
            else
              {
                sucesso = false,
              }
          },
        );
    return sucesso;
  }
}
