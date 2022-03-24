import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/data_layer/models/characters.dart';

class DetailsScreen extends StatefulWidget {
  final Character character;

  DetailsScreen({required this.character});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 600,
            //TODO:UNDERSTAND
            backgroundColor: MyColor.myGreyColor,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(),
          ),
        ],
      ),
    );
  }
}
