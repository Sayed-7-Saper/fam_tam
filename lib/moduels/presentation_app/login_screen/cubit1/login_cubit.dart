import 'package:fam_tam/model/login_model.dart';
import 'package:fam_tam/moduels/presentation_app/login_screen/cubit1/login_state.dart';
import 'package:fam_tam/share/helper/api_helper.dart';
import 'package:fam_tam/share/network/end_points.dart';
import 'package:fam_tam/share/network/remot/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

// class LoginCubit extends Cubit<LoginStates>{
//   LoginCubit():super(LoginInitialState());
//   static LoginCubit get(context)=>BlocProvider.of(context);
//   void userLogin({
//   @required int phoneNumber,
//
//   }){
//     AppUserModel loginModel ;
//     emit(LoginLoadingState());
//     DioHelper.postData(
//         url: LOGIN,
//         data: {
//           "phone_number":phoneNumber,
//         },
//     ).then((value){
//      // print(value.data);
//       loginModel = AppUserModel.fromJson(value.data);
//       emit(LoginSuccessState(loginModel));
//     }).catchError((error){
//       print(error.toString());
//       emit(LoginErrorState(error.toString()));
//       print(error.toString());
//
//     });
//
//   }
//
// }

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  Future<void> userLogin({
    @required String phoneNumber, // int
  }) async {
    AppUserModel loginModel;
    emit(LoginLoadingState());
    try{
      Map<String, dynamic> data = await Api().post(
          url: 'http://142.93.115.216/user/api/register_or_login/',
          body: {
            "phone_number": phoneNumber,
          });
      loginModel = AppUserModel.fromJson(data);
          emit(LoginSuccessState(loginModel));
          return loginModel;
    }on Exception catch (error) {
      emit(LoginErrorState(error.toString()));
          print(error.toString());
      throw Exception("Error on server !");
    }

    //.then((value) {
   //    loginModel = AppUserModel.fromJson(value.data);
   //    emit(LoginSuccessState(loginModel));
   //  }).catchError((error) {
   //    emit(LoginErrorState(error.toString()));
   //    print(error.toString());
   //  });
   // // return AppUserModel.fromJson(data);
  }
}
