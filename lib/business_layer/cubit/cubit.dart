import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/business_layer/cubit/states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/pressentation_layer/screens/business_screen.dart';
import 'package:news_app/pressentation_layer/screens/science_screen.dart';
import 'package:news_app/pressentation_layer/screens/settings_screen.dart';
import 'package:news_app/pressentation_layer/screens/sports_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitialNewsStates());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen()
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsButtonNavState());
  }
}
