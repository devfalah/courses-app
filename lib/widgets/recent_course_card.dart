import 'package:flutter/material.dart';
import 'package:tltdv/constants.dart';
import 'package:tltdv/model/course.dart';

class RecentCourseCard extends StatelessWidget {
  final Course course;

  const RecentCourseCard({Key key, this.course}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              gradient: course.background,
              borderRadius: BorderRadius.circular(41.0),
              boxShadow: [
                BoxShadow(
                  color: course.background.colors[0].withOpacity(0.3),
                  offset: Offset(0, 20),
                  blurRadius: 30.0,
                ),
                BoxShadow(
                  color: course.background.colors[1].withOpacity(0.3),
                  offset: Offset(0, 20),
                  blurRadius: 30.0,
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: course.courseSubtitle,
                        child: Text(course.courseSubtitle,
                            style: kCardSubtitleStyle),
                      ),
                      SizedBox(height: 6.0),
                      Hero(
                        tag: course.courseTitle,
                        child: Text(course.courseTitle, style: kCardTitleStyle),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Image.asset(
                        "asset/illustrations/${course.illustration}")),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 48.0),
          child: Container(
            child: Hero(
              tag: course.logo,
              child: Image.asset(
                "asset/logos/${course.logo}",
                width: 40,
                height: 40,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, 4),
                  blurRadius: 16.0,
                ),
              ],
            ),
            padding: EdgeInsets.all(12.0),
          ),
        ),
      ],
    );
  }
}
