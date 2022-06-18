import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
 class DioHelper {
   static Dio dio;
   static init() {
     dio = Dio(
       BaseOptions(
         // http://142.93.115.216/
         baseUrl: 'http://142.93.115.216/',//'http://147.182.240.32:8000/' ,  //'https://famtam.herokuapp.com/',
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
     try{
       dio.options.headers = {
         "Content-Type": "application/json",
         "lang": lang,
         'Authorization': token ?? '',
       };
       return dio.get(
           url,
           queryParameters: query
       );
     } catch (e) {
     print('${e.toString()}');
     }
   }

   static Future <Response> postData({
     @required String url,
     @required Map<String, dynamic> data,
     Map<String, dynamic>query,
     String lang = "ar",
     String token,
   }) async {
     try{
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
     }catch (e) {
       print('${e.toString()}');
     }

   }

   static Future <Response> putData({
     @required String url,
     @required Map<String, dynamic> data,
     Map<String, dynamic>query,
     String lang = "ar",
     String token,
   }) async {
     try{
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
     }catch (e) {
       print('${e.toString()}');
     }

   }
 }



