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
}

// import '../models/characters.dart';
// import '../models/quote.dart';
// import '../web_services/characters_web_services.dart';
//
// class CharactersRepository {
//   final CharactersWebServices charactersWebServices;
//
//   CharactersRepository(this.charactersWebServices);
//
//   Future<List<Character>> getAllCharacters() async {
//     final characters = await charactersWebServices.getAllCharacters();
//     return characters.map((character) => Character.fromJson(character)).toList();
//   }
//
//   Future<List<Quote>> getCharacterQuotes(String charName) async {
//     final quotes = await charactersWebServices.getCharacterQuotes(charName);
//     return quotes.map((charQuotes) => Quote.fromJson(charQuotes)).toList();
//   }
//
//
//
// }
