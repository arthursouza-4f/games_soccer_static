import 'package:firebase_auth/firebase_auth.dart';
import 'package:games_soccer_static/domain/bussines/firabase/auth_bussines.dart';
import 'package:games_soccer_static/domain/model/firabase/auth_model.dart';

class DataAuthFirabase extends AuthBussines {
  @override
  Future makeRegister({required email, required password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      String errorMessage = "";
      if (e.code == 'weak-password') {
        errorMessage = 'Senha muito Fraca.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'Já existe uma conta com esse email.';
      }

      return errorMessage;
    } catch (e) {
      return 'Erro desconhecido ao fazer registro: $e';
    }
  }

  @override
  Future makeLogin({required email, required password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      String? errorMessage = "";
      switch (e.code) {
        case "user-not-found":
          errorMessage = 'Usuario não encontrado. 🤔';
          break;
        case "wrong-password":
          errorMessage = 'Senha incorreta. ❌';
          break;
        case "invalid-credential":
          errorMessage = 'Credenciais invalidas. ❌';
          break;
      }

      return errorMessage;
    }
  }
}
