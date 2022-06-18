import 'dart:io';
import 'package:flutter/material.dart';
// class UploadImageModel{
//   // String first_name;
//   // String last_name;
//   // int age;
//   // String gender ;
//   // File image;
//   // String relative ;
//   bool data;
//   UploadImageModel({
//      // this.first_name,
//      //  this.last_name,
//      //  this.age,
//      //  this.gender,
//      //    this.image,
//      //    this.relative,
//        this.data
//   });
//   factory UploadImageModel.fromJson(json){
//     return UploadImageModel(
//       // first_name: json('frist_name'),
//       // last_name: json('last_name'),
//       // age: json('age'),
//       // gender: json('image'),
//       // relative: json('relative'),
//       data: json('data'),
//     );
//
//   }
//
// }
class UploadDataForlostPerson{
  bool status ;
  String message ;
  UploadDataForlostPerson({
    this.status,
    this.message,
  });
  factory UploadDataForlostPerson.fromjson(json){
    return UploadDataForlostPerson(
      status: json['status'],
      message: json['data'],
    );
  }


}