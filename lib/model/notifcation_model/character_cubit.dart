import 'package:bloc/bloc.dart';
import 'package:fam_tam/model/notifcation_model/cashHelper_repositry.dart';
import 'package:fam_tam/model/notifcation_model/character_model.dart';
import 'package:fam_tam/model/notifcation_model/character_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CharacterCubit extends Cubit <CharactersState>{
  final CharacterRepository characterRepository;
  CharacterCubit(this.characterRepository) : super(CharacterInitial());
  static CharacterCubit get(context)=>BlocProvider.of(context);
  List<Character>myCharacter;
  List<Character> fatchData(){
    characterRepository.getAllCharacter().
    then((myCharacter){
      emit(CharacterLoaded(myCharacter));
      this.myCharacter = myCharacter ;

    }).catchError((error){
      emit(ErrorCharacterLoading(error.toString()));
      print(error.toString());
    });
    return myCharacter;
  }


}