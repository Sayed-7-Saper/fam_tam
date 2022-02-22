import 'package:fam_tam/model/login_model.dart';
import 'package:fam_tam/moduels/presentation_app/login_screen/cubit1/login_state.dart';
import 'package:fam_tam/share/network/end_points.dart';
import 'package:fam_tam/share/network/remot/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(LoginInitialState());
  static LoginCubit get(context)=>BlocProvider.of(context);
  void userLogin({
  @required String phoneNumber,

  }){
    AppUserModel loginModel ;
    emit(LoginLoadingState());
    DioHelper.postData(
        url: LOGIN,
        data: {
          "phone_number":phoneNumber,
        },
    ).then((value){
     // print(value.data);
      loginModel = AppUserModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel));
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });

  }

}