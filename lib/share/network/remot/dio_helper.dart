import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
 class DioHelper {
   static Dio dio;
   static init() {
     dio = Dio(
       BaseOptions(
         baseUrl: 'http://147.182.240.32:8000/' ,  //'https://famtam.herokuapp.com/',
         receiveDataWhenStatusError: true,
         followRedirects: false,
         validateStatus: (status) => true,
       ),
     );
   }

   static Future <Response> getData({
     @required String url,
     Map<String, dynamic>query,
     String lang = "ar",
     String token,
   }) async {
     dio.options.headers = {
       "Content-Type": "application/json",
       "lang": lang,
     'Authorization': token ?? '',
     };
     return dio.get(
         url,
         queryParameters: query
     );
   }

   static Future <Response> postData({
     @required String url,
     @required Map<String, dynamic> data,
     Map<String, dynamic>query,
     String lang = "ar",
     String token,
   }) async {
     dio.options.headers = {
       "Content-Type": "application/json",
        'lang': lang,
       "Authorization":"Token ${token ?? '' }" ,
       // 'Authorization': token ?? '',
     };
     return dio.post(
       url,
       queryParameters: query,
       data: data,
     );
   }

   static Future <Response> putData({
     @required String url,
     @required Map<String, dynamic> data,
     Map<String, dynamic>query,
     String lang = "ar",
     String token,
   }) async {
     dio.options.headers = {
       "Content-Type": "application/json",
       'lang': lang,
       "Authorization":"Token ${token ?? '' }" ,
      // 'Authorization': token ?? '',


     };
     return dio.put(
       url,
       queryParameters: query,
       data: data,
     );
   }

 }



