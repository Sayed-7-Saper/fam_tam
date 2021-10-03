
import 'package:dio/dio.dart';
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
}