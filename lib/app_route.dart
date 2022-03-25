import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_layer/cubit/cubit.dart';
import 'package:news_app/data_layer/repository/characters_repository.dart';
import 'package:news_app/pressentation_layer/screens/character_screen.dart';
import 'package:news_app/pressentation_layer/screens/details_screen.dart';

import 'constants/strings.dart';
import 'data_layer/models/characters.dart';
import 'data_layer/web_services/characters_web_services.dart';

class AppRouter {
  late CharacterRepository characterRepository;
  late CharacterCubit characterCubit;

  AppRouter() {
    characterRepository = CharacterRepository(CharactersWebServices());
    characterCubit = CharacterCubit(characterRepository);
  }

  Route? appRouting(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => characterCubit,
            child: CharacterScreen(),
          ),
        );
      case detailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharacterCubit(characterRepository),
            child: DetailsScreen(
              character: character,
            ),
          ),
        );
    }
  }
}

// class AppRouter {
//   late CharactersRepository charactersRepository;
//   late CharactersCubit charactersCubit;
//
//   AppRouter() {
//     charactersRepository = CharactersRepository(CharactersWebServices());
//     charactersCubit = CharactersCubit(charactersRepository);
//   }
//
//   Route? generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case charactersScreen:
//         return MaterialPageRoute(
//           builder: (_) => BlocProvider(
//             create: (BuildContext contxt) => charactersCubit,
//             child: CharactersScreen(),
//           ),
//         );
//
//       case characterDetailsScreen:
//         final character = settings.arguments as Character;
//
//         return MaterialPageRoute(
//           builder: (_) => BlocProvider(
//             create: (BuildContext context) =>
//                 CharactersCubit(charactersRepository),
//             child: CharacterDetailsScreen(
//               character: character,
//             ),
//           ),
//         );
//     }
//   }
// }
