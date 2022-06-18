
import 'dart:io';
import 'package:fam_tam/model/upload_data_for_lostPerson_model.dart';
import 'package:fam_tam/share/conestans/conestans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fam_tam/moduels/notifig_connection/upLoadImage_folder/upload_image_state.dart';
import 'package:fam_tam/share/helper/api_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io' as Io;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';


class UploadImageCubit extends Cubit<UploadDataLostPersonStates> {


  UploadImageCubit() : super(UploadDataLostPersonInitialState());
  static UploadImageCubit get(context) => BlocProvider.of(context);

  File image;
  final picker = ImagePicker();

  Future <void> getImageFromCubit() async {
    emit(UploadImageLoadingState());
   // final pickedFile = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    final picFile = await picker.getImage(source: ImageSource.gallery);
      if (picFile != null) {
        image = new File(picFile.path.toString());// to
        emit(SelectImageSuccessState());
      } else {
        print('No image selected.');
        emit(SelectImageErrorState('Error When TO Select Image'));
      }

  }

  //////
 // // var fileContent = file.readAsBytesSync();
 //  List<int>fileContent = image.readAsBytesSync();
 //  // var fileContent = image.readAsBytesSync();
 //  final bytes =  Io.File(image.path).readAsBytesSync(); // path
 //  String base64Image = base64Encode(bytes); //fileContent
 // // var fileContentBase64 = base64.encode(fileContent);
  //
  /////////////////

  Future<void> testUpload({
    String first_name,
    String last_name,
    @required String age, //int
    @required String gender,
    @required String image,
    @required bool relative,
  }) async {
    UploadDataForlostPerson uploadDataForlostPerson ;
    emit(UploadDataLostPersonLoadingState());
    try {
          final url = 'http://142.93.115.216/notifications/api/notifications/';
          final body =  {
            "first_name":first_name,
            "last_name":last_name,
            "age":age,
            "gender":gender,
            "image": image,
            "relative":relative,
          };
          Map<String,String> headers= {};
          if(token != null){
            headers.addAll({
              'Authorization':'Token $token',
            });
          }
          final response = await http.post(
              Uri.parse(url),
              body: json.encode(body),
            headers:headers,
          );
          if(response.statusCode == 200 || response.statusCode ==201) {
            final responseData = json.decode(response.body);
            print(responseData);
            Map<String, dynamic> data = jsonDecode(response.body);
            uploadDataForlostPerson = UploadDataForlostPerson.fromjson(data);
            emit(UploadDataLostPersonSuccessState(uploadDataForlostPerson));
            return uploadDataForlostPerson;

          }else{
            throw Exception('there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
          }

    }on Exception catch (error) {
      emit(UploadDataLostPersonErrorState(error.toString()));
      print(error.toString());
      throw Exception("Error on server !");
    }
  }
  //////////////
  Future<void> postImage({
    String first_name ,
    String last_name,
    @required String age, //int
    @required String gender,
    @required String image,
   // @required bool relative,
    @required String relative,
  }) async {
    UploadDataForlostPerson uploadDataForlostPerson ;
   // UploadImageModel imageUploadModel;
    emit(UploadDataLostPersonLoadingState());
    try {
      Map<String, dynamic> data = await Api().post(
          url: 'http://142.93.115.216/notifications/api/notifications/',
          body: {
            "first_name":first_name,
            "last_name":last_name,
            "age":age,
            "gender":gender,
            "image": image,
            "relative":relative,
          },
        token:token,
      );
      uploadDataForlostPerson = UploadDataForlostPerson.fromjson(data);
      emit(UploadDataLostPersonSuccessState(uploadDataForlostPerson));
      return uploadDataForlostPerson;
    } on Exception catch (error) {
      emit(UploadDataLostPersonErrorState(error.toString()));
      print(error.toString());
      throw Exception("Error on server !");
    }
  }

// // Future<File>
//     upload(File imageFile) async {
//     // open a bytestream
//     var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
//     // get file length
//     var length = await imageFile.length();
//
//     // string to uri
//     var uri = Uri.parse("http://142.93.115.216/notifications/api/notifications/");
//
//     // create multipart request
//     var request = new http.MultipartRequest("POST", uri);
//
//     // multipart that takes file
//     var multipartFile = new http.MultipartFile('file', stream, length,
//         filename: basename(imageFile.path));
//
//     // add file to multipart
//     request.files.add(multipartFile);
//
//     // send
//     var response = await request.send();
//     print(" RES:${ response.statusCode}");
//
//     // listen for response
//     response.stream.transform(utf8.decoder).listen((value) {
//       print(value);
//     });
//   }

}