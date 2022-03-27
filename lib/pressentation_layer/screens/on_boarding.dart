import 'package:flutter/material.dart';
import 'package:news_app/app_route.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/constants/strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String subTitle;

  BoardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<BoardingModel> boardingModel = [
    BoardingModel(
        image: 'assets/images/no_internet.png',
        title: 'Welcome to Our Application',
        subTitle:
            'Learn what it takes to climb to the top,improve the lab,perfect your product,protect your base,and build your army'),
    BoardingModel(
      image: 'assets/images/no_internet.png',
      title: 'The Official BREAKING BAD Application',
      subTitle:
          'Criminal Elements is a story-driven,base-builder that lets you step into and shape,the world that Heisenberg built',
    ),
    BoardingModel(
        image: 'assets/images/no_internet.png',
        title: 'Criminal Elements',
        subTitle:
            'You must do whatever it takes to expand your business and protect it.Construct and upgrade new buildings,generate resources and defend your operation from rival outfits'),
  ];
  var controller = PageController();
  bool isChange = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, characterScreen);
              },
              child: Text(
                'SKIP',
                style: TextStyle(
                    color: MyColor.myYellowColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  if (index == boardingModel.length - 1) {
                    setState(() {
                      isChange = true;
                    });
                  } else {
                    setState(() {
                      isChange = false;
                    });
                  }
                },
                physics: BouncingScrollPhysics(),
                controller: controller,
                itemCount: boardingModel.length,
                itemBuilder: (context, index) =>
                    pageViewBuilder(boardingModel[index]),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: SlideEffect(
                    spacing: 5,
                    radius: 30,
                    dotWidth: 20,
                    dotHeight: 20,
                    paintStyle: PaintingStyle.stroke,
                    strokeWidth: 1,
                    dotColor: MyColor.myGreyColor,
                    activeDotColor: MyColor.myYellowColor,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  backgroundColor: MyColor.myYellowColor,
                  onPressed: () {
                    if (isChange) {
                      Navigator.pushNamed(context, characterScreen);
                    } else {
                      controller.nextPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInBack);
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget pageViewBuilder(BoardingModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage('${model.image}'),
        ),
        SizedBox(
          height: 60,
        ),
        Center(
          child: RichText(
            maxLines: 2,
            text: TextSpan(
              text: '${model.title}',
              style: TextStyle(
                  color: MyColor.myYellowColor,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              text: '${model.subTitle}',
              style: TextStyle(
                color: MyColor.myYellowColor,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
