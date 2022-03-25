import 'package:news_app/data_layer/models/characters.dart';

abstract class CharacterState {}

class InitialCharacter extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<Character> characters;

  CharacterLoaded(this.characters);
}

class QuoteLoaded extends CharacterState {
  final List<Quote> quotes;

  QuoteLoaded(this.quotes);
}
