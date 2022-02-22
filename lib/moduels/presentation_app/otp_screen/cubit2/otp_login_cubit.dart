import 'package:fam_tam/model/login_model.dart';
import 'package:fam_tam/moduels/presentation_app/otp_screen/cubit2/otp_login_state.dart';
import 'package:fam_tam/share/network/end_points.dart';
import 'package:fam_tam/share/network/remot/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpLoginCubit extends Cubit<OtpLoginStates>{
  OtpLoginCubit():super(OtpLoginInitialState());
  static OtpLoginCubit get(context)=>BlocProvider.of(context);
  void userLogin({
  @required String phoneNumber,
  @required  String code,

  }){
    AppUserModel loginModel ;
    emit(OtpLoginLoadingState());
    DioHelper.postData(
        url: VERIFY_OTP,
        data: {
          "phone_number":phoneNumber,
          "code":code,
        },
    ).then((value){
      loginModel = AppUserModel.fromJson(value.data);
      emit(OtpLoginSuccessState(loginModel));

    }).catchError((error){
      print(error.toString());
      emit(OtpLoginErrorState(error.toString()));
    });

  }

  IconData suffixIcon = Icons.visibility;
  bool isPassword = true;
  void isChangePasswordVisibility(){
    isPassword = !isPassword ;
    suffixIcon = isPassword ?Icons.visibility:Icons.visibility_off_outlined;
    emit(OtpLoginChangeIcon());
  }
}