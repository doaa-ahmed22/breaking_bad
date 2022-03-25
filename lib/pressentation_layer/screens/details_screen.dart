import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/data_layer/models/characters.dart';
import 'package:news_app/pressentation_layer/widgets/build_widgets.dart';

class DetailsScreen extends StatelessWidget {
  final Character character;

  const DetailsScreen({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      // character.betterCallSaulAppearance.isEmpty
                      //     ? Container()
                      //     : characterInfo('Better Call Saul Seasons : ',
                      //     character.appearance.join(" / ")),
                      // character.betterCallSaulAppearance.isEmpty
                      //     ? Container()
                      //     : buildDivider(150),
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
                        height: 700,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
