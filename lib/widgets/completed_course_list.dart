import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tltdv/model/course.dart';
import 'package:tltdv/widgets/completed_course_card.dart';

class CompleteCourseList extends StatefulWidget {
  @override
  _CompleteCourseListState createState() => _CompleteCourseListState();
}

class _CompleteCourseListState extends State<CompleteCourseList> {
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
            itemCount: completedCourses.length,
            controller: pageController,
            itemBuilder: (_, index) => Opacity(
              opacity: currentPage == index ? 1.0 : .5,
              child: CompleteCourseCard(course: completedCourses[index]),
            ),
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: completedCourses.length,
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
