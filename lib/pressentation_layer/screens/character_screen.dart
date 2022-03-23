import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_layer/cubit/cubit.dart';
import 'package:news_app/business_layer/cubit/states.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/data_layer/models/characters.dart';
import 'package:news_app/pressentation_layer/widgets/character_item.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  List<Character> allCharacters = [];

  @override
  void initState() {
    super.initState();
    allCharacters = BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('characters'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
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
                      itemCount: 10,
                      itemBuilder: (context, index) =>
                          CharacterItem(character: allCharacters[index]),
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
}
// }class CharactersScreen extends StatefulWidget {
//   const CharactersScreen({Key? key}) : super(key: key);
//
//   @override
//   _CharactersScreenState createState() => _CharactersScreenState();
// }
//
// class _CharactersScreenState extends State<CharactersScreen> {
//   late List<Character> allCharacters;
//   late List<Character> searchedForCharacters;
//   bool _isSearching = false;
//   final _searchTextController = TextEditingController();
//
//   Widget _buildSearchField() {
//     return TextField(
//       controller: _searchTextController,
//       cursorColor: MyColors.myGrey,
//       decoration: InputDecoration(
//         hintText: 'Find a character...',
//         border: InputBorder.none,
//         hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18),
//       ),
//       style: TextStyle(color: MyColors.myGrey, fontSize: 18),
//       onChanged: (searchedCharacter) {
//         addSearchedFOrItemsToSearchedList(searchedCharacter);
//       },
//     );
//   }
//
//   void addSearchedFOrItemsToSearchedList(String searchedCharacter) {
//     searchedForCharacters = allCharacters
//         .where((character) =>
//         character.name.toLowerCase().startsWith(searchedCharacter))
//         .toList();
//     setState(() {});
//   }
//
//   List<Widget> _buildAppBarActions() {
//     if (_isSearching) {
//       return [
//         IconButton(
//           onPressed: () {
//             _clearSearch();
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.clear, color: MyColors.myGrey),
//         ),
//       ];
//     } else {
//       return [
//         IconButton(
//           onPressed: _startSearch,
//           icon: Icon(
//             Icons.search,
//             color: MyColors.myGrey,
//           ),
//         ),
//       ];
//     }
//   }
//
//   void _startSearch() {
//     ModalRoute.of(context)!
//         .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
//
//     setState(() {
//       _isSearching = true;
//     });
//   }
//
//   void _stopSearching() {
//     _clearSearch();
//
//     setState(() {
//       _isSearching = false;
//     });
//   }
//
//   void _clearSearch() {
//     setState(() {
//       _searchTextController.clear();
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<CharactersCubit>(context).getAllCharacters();
//   }
//
//   Widget buildBlocWidget() {
//     return BlocBuilder<CharactersCubit, CharactersState>(
//       builder: (context, state) {
//         if (state is CharactersLoaded) {
//           allCharacters = (state).characters;
//           return buildLoadedListWidgets();
//         } else {
//           return showLoadingIndicator();
//         }
//       },
//     );
//   }
//
//   Widget showLoadingIndicator() {
//     return Center(
//       child: CircularProgressIndicator(
//         color: MyColors.myYellow,
//       ),
//     );
//   }
//
//   Widget buildLoadedListWidgets() {
//     return SingleChildScrollView(
//       child: Container(
//         color: MyColors.myGrey,
//         child: Column(
//           children: [
//             buildCharactersList(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildCharactersList() {
//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 2 / 3,
//         crossAxisSpacing: 1,
//         mainAxisSpacing: 1,
//       ),
//       shrinkWrap: true,
//       physics: const ClampingScrollPhysics(),
//       padding: EdgeInsets.zero,
//       itemCount: _searchTextController.text.isEmpty
//           ? allCharacters.length
//           : searchedForCharacters.length,
//       itemBuilder: (ctx, index) {
//         return CharacterItem(
//           character: _searchTextController.text.isEmpty
//               ? allCharacters[index]
//               : searchedForCharacters[index],
//         );
//       },
//     );
//   }
//
//   Widget _buildAppBarTitle() {
//     return Text(
//       'Characters',
//       style: TextStyle(color: MyColors.myGrey),
//     );
//   }
//
//   Widget buildNoInternetWidget() {
//     return Center(
//       child: Container(
//         color: Colors.white,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               'Can\'t connect .. check internet',
//               style: TextStyle(
//                 fontSize: 22,
//                 color: MyColors.myGrey,
//               ),
//             ),
//             Image.asset('assets/images/no_internet.png')
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: MyColors.myYellow,
//         leading: _isSearching
//             ? BackButton(
//           color: MyColors.myGrey,
//         )
//             : Container(),
//         title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
//         actions: _buildAppBarActions(),
//       ),
//       body: OfflineBuilder(
//         connectivityBuilder: (
//             BuildContext context,
//             ConnectivityResult connectivity,
//             Widget child,
//             ) {
//           final bool connected = connectivity != ConnectivityResult.none;
//
//           if (connected) {
//             return buildBlocWidget();
//           } else {
//             return buildNoInternetWidget();
//           }
//         },
//         child: showLoadingIndicator(),
//       ),
//     );
//   }
// }
