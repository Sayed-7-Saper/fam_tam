// class AppUserModel {
//   bool status;
//   bool code_status;
//   String message;
//  // String phone_number;
//   int phone_number;
//  // String code;
//   int code;
//   String token;
//   int user_id;
//   UserData data;
//   AppUserModel({
//     this.status,
//     this.code_status,
//     this.message,
//     this.phone_number,
//     this.code,
//     this.token,
//     this.user_id,
//     this.data,
//   });
//
//   AppUserModel.fromJson(Map<String, dynamic> json) {
//     if (json == null) {
//       return;
//     }
//     status = json['status'];
//     code_status = json['code_status'];
//     message = json['message'];
//     phone_number = json['phone_number'];
//     code = json['code'];
//     token = json['token'];
//     user_id = json['user_id'];
//     data = json['data'] != null ? UserData.fromJson(json['data']) : null;
//   }
//   // toJson() {
//   //   return {
//   //     'status': status,
//   //     'code_status':code_status,
//   //     'message': message,
//   //     'phone_number': phone_number,
//   //     'code': code,
//   //     'token': token,
//   //     'user_id': user_id,
//   //     'data': data,
//   //   };
//   // }
// }
//
// class UserData {
//   String first_name;
//   String last_name;
//  // String age;
//   int age;
//   String gender;
//   String image;
//   bool data_status;
//   UserData({
//     this.first_name,
//     this.last_name,
//     this.age,
//     this.gender,
//     this.image,
//     this.data_status,
//   });
//   UserData.fromJson(Map<String, dynamic> json) {
//     if (json == null) {
//       return;
//     }
//     first_name = json['first_name'];
//     last_name = json['last_name'];
//     age = json['age'];
//     gender = json['gender'];
//     image = json['image'];
//     data_status= json['data_status'];
//   }
//   // toJson() {
//   //   return {
//   //     'first_name': first_name,
//   //     'last_name': last_name,
//   //     'age': age,
//   //     'gender': gender,
//   //     'image': image,
//   //     'data_status':data_status,
//   //   };
//   // }
// }



////////////////////////////////////////////////////////////////////////////////

import 'dart:io';

import 'package:flutter/material.dart';
class AppUserModel {
 final bool status;
 final bool code_status;
 final String message;
 final String phone_number; //
 final String code; // int
 final String token;
 final int user_id;
 final UserData data;
 final bool data_status; //

 AppUserModel({
   @required this.status,
    @required this.code_status,
    @required this.message,
    @required this.phone_number,
    @required this.code,
    @required this.token,
    @required this.user_id,
    @required this.data,
   @required this.data_status, //

 });

  factory AppUserModel.fromJson(json){
    return AppUserModel(
        status: json['status'],
        code_status: json['code_status'],
        message:  json['message'],
        phone_number: json['phone_number'],
        code: json['code'],
        token: json['token'],
        user_id: json['user_id'],
        data: json['data'] != null ? UserData.fromJson(json['data']) : null,
      data_status: json['data_status'],

    );
  }


}

class UserData {
  final String first_name;
  final String last_name;
  final String age; //  int
  final String gender;
  final File image;
  UserData({
    @required this.first_name,
    @required this.last_name,
    @required this.age,
    @required this.gender,
    @required this.image,
  });
  factory UserData.fromJson(json){
    return UserData(
        first_name: json['first_name'],
        last_name: json['last_name'],
        age:  json['age'],
        gender: json['gender'],
        image: json['image'],
    );
  }


}
