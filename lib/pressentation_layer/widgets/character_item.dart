import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/constants/strings.dart';
import 'package:news_app/data_layer/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColor.myWhiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, detailsScreen);
        },
        child: GridTile(
          footer: Hero(
            tag: character.charId,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              color: Colors.black38,
              alignment: Alignment.bottomCenter,
              child: Center(
                child: Text(
                  '${character.name}',
                  style: TextStyle(
                    color: MyColor.myWhiteColor,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: MyColor.myGreyColor,
            child: character.img.isNotEmpty
                ? FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading.gif',
                    image: character.img,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )
                : Image.asset('assets/images/loading_nonshowed.jpg'),
          ),
        ),
      ),
    );
  }
}
