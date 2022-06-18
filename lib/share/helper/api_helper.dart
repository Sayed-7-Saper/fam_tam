import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

//http://142.93.115.216/

class Api{
  Future <dynamic> get({@required String url})async{
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode == 200|| response.statusCode ==201){
      return jsonDecode(response.body);

    }else{
      throw Exception('there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');

      //throw Exception('there is a problem with status code ${response.statusCode}');

    }
  }
  Future<dynamic> post({@required String url,@required dynamic body, String token})async{
    Map<String,String> headers= {};
    if(token != null){
      headers.addAll({
        'Authorization':'Token $token ',
      });
    }
    print('url = $url , body =$body , token =$token ');
    http.Response  response= await http.post(
   Uri.parse(url),
       body: body,
        headers:headers,
);
    if(response.statusCode == 200 || response.statusCode ==201) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    }else{
      throw Exception('there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
}
  Future<dynamic> put({@required String url,@required dynamic body, String token})async{
    Map<String,String> headers= {};
    if(token != null){
      headers.addAll({
        'Authorization':'Token $token ',
      });
    }
    print('url = $url , body =$body , token =$token ');
    http.Response  response= await http.put(
      Uri.parse(url),
      body: body,
      headers:headers,
    );
    if(response.statusCode == 200|| response.statusCode ==201) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    }else{
      throw Exception('there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }

}