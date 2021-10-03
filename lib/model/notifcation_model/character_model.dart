class Character{
  int charId ;
  String name;
  String brithday;
  List<dynamic>roleInSesson;
  String image;
  String status;
  String nicKName;
  List <dynamic>apperancOFBreakingSesson;
  String nameActor;
  String categoryForTwoSeries;
  List<dynamic>apperancOFBetterCallSaulSesson;
  Character.fromJson(Map<String,dynamic>json){
    charId =json['char_id'];
    name=json['name'];
    brithday=json['birthday'];
    roleInSesson=json['occupation'];
    image=json['img'];
    status=json['status'];
    nicKName=json['nickname'];
    apperancOFBreakingSesson=json['appearance'];
    nameActor=json['portrayed'];
    categoryForTwoSeries=json['category'];
    apperancOFBetterCallSaulSesson=json['better_call_saul_appearance'];


  }
 // toJson()=>{ 'char_id' :charId ,'name':name,'img':image,....};

}