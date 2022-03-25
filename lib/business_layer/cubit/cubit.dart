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

  void getQuotes(String charName) {
    characterRepository.getAllQuotes(charName).then((quotes) {
      emit(QuoteLoaded(quotes));
    });
  }
}
