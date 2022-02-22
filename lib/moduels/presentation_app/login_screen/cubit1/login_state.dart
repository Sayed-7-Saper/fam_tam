
import 'package:fam_tam/model/login_model.dart';

abstract  class LoginStates{}
class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  final AppUserModel loginModel ;

  LoginSuccessState(this.loginModel);
}
class LoginErrorState extends LoginStates{
  final String error;
  LoginErrorState(this.error);
}
