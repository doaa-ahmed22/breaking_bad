import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
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
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                  width: double.infinity,
                  margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  padding: EdgeInsetsDirectional.all(4),
                  decoration: BoxDecoration(
                    color: MyColor.myWhiteColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: GridTile(
                    footer: Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      color: Colors.black38,
                      alignment: Alignment.bottomCenter,
                      child: Center(
                        child: Text(
                          'efkee ekfje ',
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
                    child: Container(
                      color: MyColor.myGreyColor,
                      child: Image.network(
                        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.fotor.com%2F&psig=AOvVaw276-2d-nnATA51hCYf4Ynw&ust=1648136330550000&source=images&cd=vfe&ved=2ahUKEwjB-rq1yNz2AhUOzyoKHTDGCKcQjRx6BAgAEAk',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
