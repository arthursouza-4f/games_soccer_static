import 'package:games_soccer_static/domain/model/firabase/auth_model.dart';

abstract class AuthBussines {
  Future makeRegister({required email, required password});
  Future makeLogin({required email, required password});
}
