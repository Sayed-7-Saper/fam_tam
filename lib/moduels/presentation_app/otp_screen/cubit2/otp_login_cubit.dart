import 'package:fam_tam/model/login_model.dart';
import 'package:fam_tam/moduels/presentation_app/otp_screen/cubit2/otp_login_state.dart';
import 'package:fam_tam/share/helper/api_helper.dart';
import 'package:fam_tam/share/network/end_points.dart';
import 'package:fam_tam/share/network/remot/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class OtpLoginCubit extends Cubit<OtpLoginStates>{
//   OtpLoginCubit():super(OtpLoginInitialState());
//   static OtpLoginCubit get(context)=>BlocProvider.of(context);
//   void userLogin({
//   @required int phoneNumber,
//   @required  int code,
//
//   }){
//     AppUserModel loginModel ;
//     emit(OtpLoginLoadingState());
//     DioHelper.postData(
//         url: VERIFY_OTP,
//         data: {
//           "phone_number":phoneNumber,
//           "code":code,
//         },
//     ).then((value){
//       loginModel = AppUserModel.fromJson(value.data);
//       emit(OtpLoginSuccessState(loginModel));
//
//     }).catchError((error){
//       emit(OtpLoginErrorState(error.toString()));
//       print(error.toString());
//
//     });
//
//   }
//
//   IconData suffixIcon = Icons.visibility;
//   bool isPassword = true;
//   void isChangePasswordVisibility(){
//     isPassword = !isPassword ;
//     suffixIcon = isPassword ?Icons.visibility:Icons.visibility_off_outlined;
//     emit(OtpLoginChangeIcon());
//   }
// }



class OtpLoginCubit extends Cubit<OtpLoginStates>{
  OtpLoginCubit():super(OtpLoginInitialState());
  static OtpLoginCubit get(context)=>BlocProvider.of(context);
  Future<AppUserModel> userLogin({
    @required String phoneNumber,
    @required  String  code, //   int

  })async{
    AppUserModel loginModel ;
    emit(OtpLoginLoadingState());
    try{
      Map<String,dynamic> data = await Api().post(
        url: 'http://142.93.115.216/user/api/verify/',
        body: {
          "phone_number":phoneNumber,
          "code":code,
        },
      );
      loginModel = AppUserModel.fromJson(data);
      emit(OtpLoginSuccessState(loginModel));
      return loginModel;
    }on Exception catch(error){
      emit(OtpLoginErrorState(error.toString()));
         print(error.toString());
    }

    //.then((value){
    //   loginModel = AppUserModel.fromJson(value.data);
    //   emit(OtpLoginSuccessState(loginModel));
    //
    // }).catchError((error){
    //   emit(OtpLoginErrorState(error.toString()));
    //   print(error.toString());
    //
    // });
    //
    // return AppUserModel.fromJson(data);
  }

}