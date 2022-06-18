import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
class CharacterWebServices {
  Dio dio;

  CharacterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://www.breakingbadapi.com/api/',
      receiveDataWhenStatusError: true,
      connectTimeout: 30 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = new Dio(options);
  }

  Future<List<dynamic>> getAllCharacter() async {
    try {
      Response responsed = await dio.get('characters');
      // print(respons.data.toString());
      return responsed.data;
    }
    catch (e) {
      print('${e.toString()}');
    }
  }
  // static Future <Response> postData({
  //   @required String url,
  //   @required Map<String, dynamic> data,
  //   Map<String, dynamic>query,
  //   String lang = "ar",
  //   String token,
  // }) async {
  //   try{
  //     dio.options.headers = {
  //       "Content-Type": "application/json",
  //       'lang': lang,
  //       "Authorization":"Token ${token ?? '' }" ,
  //       // 'Authorization': token ?? '',
  //     };
  //     return dio.post(
  //       url,
  //       queryParameters: query,
  //       data: data,
  //     );
  //   }catch (e) {
  //     print('${e.toString()}');
  //   }
  //
  // }

}