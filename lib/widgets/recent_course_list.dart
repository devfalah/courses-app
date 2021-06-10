import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tltdv/model/course.dart';
import 'package:tltdv/screens/course_screen.dart';
import 'package:tltdv/widgets/recent_course_card.dart';

class RecentCourseList extends StatefulWidget {
  @override
  _RecentCourseListState createState() => _RecentCourseListState();
}

class _RecentCourseListState extends State<RecentCourseList> {
  var pageController = PageController(initialPage: 0, viewportFraction: 0.70);

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320,
          width: double.infinity,
          child: PageView.builder(
            itemCount: recentCourses.length,
            controller: pageController,
            itemBuilder: (_, index) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CourseScreen(
                      course: recentCourses[index],
                    ),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: Opacity(
                  opacity: currentPage == index ? 1.0 : .5,
                  child: RecentCourseCard(course: recentCourses[index])),
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
          count: 3,
          effect: ExpandingDotsEffect(
            activeDotColor: Color(0xff0917FE),
            dotColor: Color(0xffA6ABDE),
          ),
          onDotClicked: (index) {},
        )
      ],
    );
  }
}
