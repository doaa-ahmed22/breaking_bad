import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_layer/cubit/cubit.dart';
import 'package:news_app/business_layer/cubit/states.dart';
import 'package:news_app/data_layer/dio.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                //country=eg&apiKey=053283fbc7ef48bdbc3e5595f6872f1f

                DioHelper.getData(
                  url: 'v2/top-headlines',
                  query: {
                    'country': 'eg',
                    'apiKey': '053283fbc7ef48bdbc3e5595f6872f1f',
                  },
                ).then((value) {
                  print(value!.data?['articles'][0]['title']);
                }).catchError((error) {
                  print(error.toString());
                });
              },
              child: Icon(Icons.add),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: cubit.bottomItem,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
            ),
          );
        },
      ),
    );
  }
}
