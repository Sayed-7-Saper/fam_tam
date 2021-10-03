
import 'package:bloc/bloc.dart';
import 'package:fam_tam/moduels/login/states1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

static LoginCubit get(context) => BlocProvider.of(context);

IconData suffix = Icons.visibility_outlined;
bool isPassword = true;

void changePasswordVisibility()
{
  isPassword = !isPassword;
  suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

  emit(ChangePasswordVisibilityState());
}
}
