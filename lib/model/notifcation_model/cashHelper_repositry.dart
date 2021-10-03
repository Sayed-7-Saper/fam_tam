
import 'package:fam_tam/model/notifcation_model/character_model.dart';
import 'package:fam_tam/model/notifcation_model/dioHelper_webServes.dart';

class CharacterRepository {
  CharacterWebServices charaWebServ;

  CharacterRepository(this.charaWebServ);

  Future<List<Character>> getAllCharacter() async {
    final characters = await charaWebServ.getAllCharacter();
    return characters.map((character) => Character.fromJson(character))
        .toList();
  }
}