import 'package:bloc/bloc.dart';
import 'package:news_app/business_layer/cubit/states.dart';
import 'package:news_app/data_layer/models/characters.dart';
import 'package:news_app/data_layer/repository/characters_repository.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepository characterRepository;
  List<Character> character = [];
  CharacterCubit(this.characterRepository) : super(InitialCharacter());

  List<Character> getAllCharacters() {
    characterRepository.getAllCharacters().then((char) {
      emit(CharacterLoaded(char));
      character = char;
    });
    return character;
  }
}

// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
//
// import '../../data/models/characters.dart';
// import '../../data/models/quote.dart';
// import '../../data/repository/characters_repository.dart';
//
// part 'characters_state.dart';
//
// class CharactersCubit extends Cubit<CharactersState> {
//   final CharactersRepository charactersRepository;
//   List<Character> characters = [];
//
//   CharactersCubit(this.charactersRepository) : super(CharactersInitial());
//
//   List<Character> getAllCharacters() {
//     charactersRepository.getAllCharacters().then((characters) {
//       emit(CharactersLoaded(characters));
//       this.characters = characters;
//     });
//
//     return characters;
//   }
//
//   void getQuotes(String charName) {
//     charactersRepository.getCharacterQuotes(charName).then((quotes) {
//       emit(QuotesLoaded(quotes));
//     });
//   }
// }
