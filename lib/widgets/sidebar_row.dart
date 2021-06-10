import 'package:flutter/material.dart';
import 'package:tltdv/model/sidebar.dart';

import '../constants.dart';

class SidebarRow extends StatelessWidget {
  final SidebarItem item;

  SidebarRow({this.item});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10.0),
          width: 42.0,
          height: 42.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            gradient: item.background,
          ),
          child: item.icon,
        ),
        SizedBox(width: 12.0),
        Text(
          item.title,
          style: kCalloutLabelStyle,
        ),
      ],
    );
  }
}
