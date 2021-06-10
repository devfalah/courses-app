import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tltdv/model/course.dart';
import 'package:tltdv/widgets/continue_watch_card.dart';

class ContinueWatchingList extends StatefulWidget {
  @override
  _ContinueWatchingListState createState() => _ContinueWatchingListState();
}

class _ContinueWatchingListState extends State<ContinueWatchingList> {
  var pageController = PageController(initialPage: 0, viewportFraction: 0.70);

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          child: PageView.builder(
            itemCount: continueWatchingCourses.length,
            controller: pageController,
            itemBuilder: (_, index) => Opacity(
                opacity: currentPage == index ? 1.0 : .5,
                child: ContinueWatchingCard(
                    course: continueWatchingCourses[index])),
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: continueWatchingCourses.length,
          effect: WormEffect(
            activeDotColor: Color(0xff0917FE),
            dotColor: Color(0xffA6ABDE),
          ),
          onDotClicked: (index) {},
        )
      ],
    );
  }
}
