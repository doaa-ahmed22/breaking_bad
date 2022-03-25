import 'package:news_app/data_layer/models/characters.dart';
import 'package:news_app/data_layer/web_services/characters_web_services.dart';

class CharacterRepository {
  final CharactersWebServices charactersWebServices;

  CharacterRepository(this.charactersWebServices);

  Future<List<Character>> getAllCharacters() async {
    final listCharacter = await charactersWebServices.getAllCharacters();
    return listCharacter
        .map((characters) => Character.fromJson(characters))
        .toList();
  }

  Future<List<Quote>> getAllQuotes(String charName) async {
    final quotes = await charactersWebServices.getAllQuotes(charName);
    return quotes.map((charQuotes) => Quote.fromJson(charQuotes)).toList();
  }
}
