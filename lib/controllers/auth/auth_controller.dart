import 'package:games_soccer_static/data/firabase/data_auth_firabase.dart';
import 'package:games_soccer_static/domain/bussines/firabase/auth_bussines.dart';
import 'package:games_soccer_static/domain/model/firabase/auth_model.dart';

class AuthController extends AuthBussines{
  
  @override
  Future makeRegister({required email, required password}) {
    return DataAuthFirabase().makeRegister(email: email, password: password);
  }
  
  @override
  Future makeLogin({required email, required password}) {
    return DataAuthFirabase().makeLogin(email: email, password: password);
  }

}