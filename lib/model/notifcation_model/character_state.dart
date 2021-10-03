

import 'package:fam_tam/model/notifcation_model/character_model.dart';

abstract class CharactersState{}
class CharacterInitial extends CharactersState{}
class CharacterLoaded extends CharactersState{
  final List<Character> Characters;
  CharacterLoaded(this.Characters);
}
class ErrorCharacterLoading extends CharactersState{
   final String error;
  ErrorCharacterLoading(this.error);
}