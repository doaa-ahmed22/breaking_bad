import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_layer/cubit/cubit.dart';
import 'package:news_app/business_layer/cubit/states.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/data_layer/models/characters.dart';
import 'package:news_app/pressentation_layer/widgets/build_widgets.dart';

class DetailsScreen extends StatelessWidget {
  final Character character;

  const DetailsScreen({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharacterCubit>(context).getQuotes(character.name);
    return Scaffold(
      backgroundColor: MyColor.myGreyColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 600,
            pinned: true,
            stretch: true,
            backgroundColor: MyColor.myYellowColor,
            flexibleSpace: FlexibleSpaceBar(
              // centerTitle: true,
              title: Text(
                character.nickname,
                style: TextStyle(color: MyColor.myWhiteColor),
              ),
              background: Hero(
                tag: character.charId,
                child: Image.network(
                  character.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitle('name in the series : ', character.portrayed),
                      buildDivider(175),
                      buildTitle(
                        'jobs : ',
                        character.occupation.join(' / '),
                      ),
                      buildDivider(300),
                      buildTitle('Appeared in : ', character.category),
                      buildDivider(230),
                      buildTitle(
                          'Seasons : ', character.appearance.join(' / ')),
                      buildDivider(260),
                      buildTitle('Status : ', character.status),
                      buildDivider(280),
                      buildTitle('Actor/Actress : ', character.name),
                      buildDivider(210),
                      buildTitle('birthday : ', character.birthday),
                      buildDivider(265),
                      character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : buildTitle(
                              'Better Call Saul Seasons :  ',
                              character.betterCallSaulAppearance.join(' / '),
                            ),
                      character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : buildDivider(119),
                      SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<CharacterCubit, CharacterState>(
                        builder: (context, state) {
                          return checkIfQuotesAreLoaded(state);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget checkIfQuotesAreLoaded(CharacterState state) {
  if (state is QuoteLoaded) {
    return displayRandomQuoteOrEmptySpace(state);
  } else {
    return showProgressIndicator();
  }
}

Widget displayRandomQuoteOrEmptySpace(state) {
  var quotes = (state).quotes;
  if (quotes.length != 0) {
    int randomQuoteIndex = Random().nextInt(quotes.length - 1);
    return Center(
      child: DefaultTextStyle(
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: MyColor.myWhiteColor,
          shadows: [
            Shadow(
              blurRadius: 7,
              color: MyColor.myYellowColor,
              offset: Offset(0, 0),
            )
          ],
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            FlickerAnimatedText(quotes[randomQuoteIndex].quote),
          ],
        ),
      ),
    );
  } else {
    return Container();
  }
}

Widget showProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(
      color: MyColor.myYellowColor,
    ),
  );
}
