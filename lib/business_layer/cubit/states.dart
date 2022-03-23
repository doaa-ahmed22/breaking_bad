import 'package:news_app/data_layer/models/characters.dart';

abstract class CharacterState {}

class InitialCharacter extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<Character> characters;

  CharacterLoaded(this.characters);
}

//
// part of 'characters_cubit.dart';
//
// @immutable
// abstract class CharactersState {}
//
// class CharactersInitial extends CharactersState {}
//
//
// class CharactersLoaded extends CharactersState {
//   final List<Character> characters;
//
//   CharactersLoaded(this.characters);
// }
//
// class QuotesLoaded extends CharactersState {
//   final List<Quote> quotes;
//
//   QuotesLoaded(this.quotes);
// }
