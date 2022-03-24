import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_layer/cubit/cubit.dart';
import 'package:news_app/business_layer/cubit/states.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/constants/strings.dart';
import 'package:news_app/data_layer/models/characters.dart';
import 'package:news_app/pressentation_layer/widgets/character_item.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<Character> allCharacters;
  late List<Character> searchedItem;
  bool _isSearched = false;
  final _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: _isSearched ? _buildSearchController() : Text('characters'),
        actions: _appActions(),
        leading: _isSearched
            ? BackButton(
                onPressed: () {
                  _clearSearching();
                  Navigator.pop(context);
                },
                color: MyColor.myWhiteColor,
              )
            : Container(),
      ),
      body: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoaded) {
            allCharacters = (state).characters;
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 3,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1),
                      //TODO:REMOVE
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: _textEditingController.text.isEmpty
                          ? allCharacters.length
                          : searchedItem.length,
                      itemBuilder: (context, index) => CharacterItem(
                          character: _textEditingController.text.isEmpty
                              ? allCharacters[index]
                              : searchedItem[index]),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: MyColor.myYellowColor,
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildSearchController() {
    return TextField(
      controller: _textEditingController,
      cursorColor: MyColor.myWhiteColor,
      decoration: InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(fontSize: 18, color: MyColor.myWhiteColor),
      ),
      style: TextStyle(fontSize: 18, color: MyColor.myWhiteColor),
      onChanged: (searchedCharacter) {
        _searchedForItemsToSearchedList(searchedCharacter);
      },
    );
  }

  void _searchedForItemsToSearchedList(String searchedCharacter) {
    searchedItem = allCharacters
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> _appActions() {
    if (_isSearched) {
      return [
        IconButton(
          onPressed: () {
            _clearSearching();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.clear,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: () {
            _startSearching();
          },
          icon: Icon(
            Icons.search,
          ),
        ),
      ];
    }
  }

  void _startSearching() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearched = true;
    });
  }

  void _stopSearching() {
    _clearSearching;
    setState(() {
      _isSearched = false;
    });
  }

  void _clearSearching() {
    setState(() {
      _textEditingController.clear();
    });
  }
}
