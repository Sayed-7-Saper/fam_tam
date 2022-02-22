
import 'package:fam_tam/model/login_model.dart';

abstract  class OtpLoginStates{}
class OtpLoginInitialState extends OtpLoginStates{}
class OtpLoginLoadingState extends OtpLoginStates{}
class OtpLoginSuccessState extends OtpLoginStates{
  final AppUserModel loginModel ;

  OtpLoginSuccessState(this.loginModel);
}
class OtpLoginErrorState extends OtpLoginStates{
  final String error;
  OtpLoginErrorState(this.error);
}
class OtpLoginChangeIcon extends OtpLoginStates{}