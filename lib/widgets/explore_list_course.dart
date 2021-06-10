import 'package:flutter/material.dart';
import 'package:tltdv/model/course.dart';
import 'package:tltdv/widgets/explore_course_card.dart';

class ExploreCoursesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recentCourses.length,
        shrinkWrap: true,
        itemBuilder: (_, index) => Padding(
          padding: EdgeInsets.only(left: index == 0 ? 20.0 : 0.0),
          child: ExploreCourseCard(
            course: recentCourses[index],
          ),
        ),
      ),
    );
  }
}
