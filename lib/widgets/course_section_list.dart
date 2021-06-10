import 'package:flutter/material.dart';
import 'package:tltdv/model/course.dart';
import 'package:tltdv/widgets/course_section_card.dart';

import '../constants.dart';

class CourseSectionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: courseSections.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index != courseSections.length)
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CourseSectionCard(
                course: courseSections[index],
              ),
            );
          else {
            return Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                "No more section to view, look\n for more view",
                style: kCaptionLabelStyle,
                textAlign: TextAlign.center,
              ),
            );
          }
        },
      ),
    );
  }
}
