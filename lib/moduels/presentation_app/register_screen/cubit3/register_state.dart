import 'package:fam_tam/model/login_model.dart';

abstract  class RegisterStates{}
class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{
  final AppUserModel registerModel ;

  RegisterSuccessState(this.registerModel);
}
class RegisterErrorState extends RegisterStates{
  final String error;
  RegisterErrorState(this.error);
}
class RegisterChangeIcon extends RegisterStates{}