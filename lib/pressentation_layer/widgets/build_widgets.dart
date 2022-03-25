import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/constants/strings.dart';

Widget buildTitle(String title, String value) {
  return RichText(
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.start,
    text: TextSpan(
      children: [
        TextSpan(
          text: title,
          style: style,
        ),
        TextSpan(
          text: value,
          style: littleStyle,
        ),
      ],
    ),
  );
}

Widget buildDivider(double divider) {
  return Divider(
    color: MyColor.myYellowColor,
    height: 30,
    thickness: 2,
    endIndent: divider,
  );
}
