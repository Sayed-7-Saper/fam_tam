
import 'package:fam_tam/model/upload_data_for_lostPerson_model.dart';

abstract  class UploadDataLostPersonStates{}
class UploadDataLostPersonInitialState extends UploadDataLostPersonStates{}
class UploadDataLostPersonLoadingState extends UploadDataLostPersonStates{}
class UploadDataLostPersonSuccessState extends UploadDataLostPersonStates{
  final UploadDataForlostPerson uploadDataForlostPerson ;
  UploadDataLostPersonSuccessState(this.uploadDataForlostPerson);
}
class UploadDataLostPersonErrorState extends UploadDataLostPersonStates{
  final String error;
  UploadDataLostPersonErrorState(this.error);
}


class  UploadImageLoadingState extends UploadDataLostPersonStates{}
class  SelectImageSuccessState extends UploadDataLostPersonStates{}
class  SelectImageErrorState extends UploadDataLostPersonStates{
  final String error;
  SelectImageErrorState(this.error);
}


