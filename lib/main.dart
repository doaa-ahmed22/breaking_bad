import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/app_route.dart';
import 'package:news_app/constants/colors.dart';

import 'business_layer/cubit/bloc_opserval.dart';

void main() {
  BlocOverrides.runZoned(
    () {},
    blocObserver: MyBlocObserver(),
  );

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //   selectedItemColor: Colors.deepOrange,
        //   elevation: 20.0,
        //   type: BottomNavigationBarType.fixed,
        // ),

        // floatingActionButtonTheme: FloatingActionButtonThemeData(
        //   backgroundColor: Colors.deepOrange,
        // ),
        scaffoldBackgroundColor: MyColor.myGreyColor,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: MyColor.myWhiteColor,
          ),
          titleTextStyle: TextStyle(
            color: MyColor.myWhiteColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          color: MyColor.myYellowColor,
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: MyColor.myYellowColor,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
      ),
      onGenerateRoute: appRouter.appRouting,
    );
  }
}
