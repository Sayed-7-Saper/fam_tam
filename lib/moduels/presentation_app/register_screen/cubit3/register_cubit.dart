
import 'package:fam_tam/model/login_model.dart';
import 'package:fam_tam/moduels/presentation_app/register_screen/cubit3/register_state.dart';
import 'package:fam_tam/share/network/end_points.dart';
import 'package:fam_tam/share/network/remot/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit():super(RegisterInitialState());
  static RegisterCubit get(context)=>BlocProvider.of(context);
  void userRegister({
    @required String token,
    @required String first_name,
    @required String last_name,
    @required int age,
    @required String gender,
    String image,
  }){
    AppUserModel loginModel ;
    emit(RegisterLoadingState());
    DioHelper.putData(
      url: REGISTER,
      token: token,
      data: {
        "first_name":first_name,
        "last_name":last_name,
        "age":age,
        "gender":gender,
        "image":image,
      },
    ).then((value){
      loginModel = AppUserModel.fromJson(value.data);
      emit(RegisterSuccessState(loginModel));

    }).catchError((error){
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });

  }


}