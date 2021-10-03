

import 'package:conditional_builder/conditional_builder.dart';
import 'package:fam_tam/moduels/login/cubit1.dart';
import 'package:fam_tam/moduels/login/states1.dart';
import 'package:fam_tam/moduels/register/register_screen.dart';
import 'package:fam_tam/share/compontent/compontents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
 // var emailController = TextEditingController();
  var OtpPasswordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(backgroundColor: Colors.white,
            elevation: 0.0,),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          'Login now to Communication with friends',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultTextFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your Phone';
                            }
                          },
                          label: 'Phone ',
                          hintText: 'Enter Phone ',
                          prefix: Icons.phone,
                        ),

                        Row(
                          children: [
                            Spacer(),
                            TextButton(onPressed: (){},
                                child: Text('Sent',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultTextFormField(
                          controller: OtpPasswordController,
                          type: TextInputType.number,
                          suffix: LoginCubit.get(context).suffix,
                          onSubmit: (value) {
                            if (formKey.currentState.validate()) {
                             /* LoginCubit.get(context).userLogin(
                                //email: Controller.text,
                                //password: passwordController.text,
                              );*/
                            }
                          },
                          isPassword: LoginCubit.get(context).isPassword,
                          suffixPressed: () {
                            LoginCubit.get(context)
                                .changePasswordVisibility();
                          },
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Otp_password is too short';
                            }
                          },
                          label: 'OTP_Password',
                          hintText: 'Enter OTP',
                          prefix: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState.validate()) {
                             /*   LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );*/
                              }
                              navigateToPage(
                                context,
                                RegisterScreen(),
                              );
                            },
                            text: 'login',
                            isUpperCase: true,
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                       /* Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',style:TextStyle(fontSize: 15.0,),
                            ),
                            defaultTextButton(
                              function: () {
                                navigateToPage(
                                  context,
                                  RegisterScreen(),
                                );
                              },
                              text: 'register',
                            ),
                          ],
                        ),*/
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );

  }
}

