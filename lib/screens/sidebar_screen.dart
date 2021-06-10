import 'package:flutter/material.dart';
import 'package:tltdv/model/sidebar.dart';
import 'package:tltdv/widgets/sidebar_row.dart';

import '../constants.dart';

class SidebarScreen extends StatelessWidget {
  const SidebarScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      height: deviceSize.height,
      width: deviceSize.width * .85,
      padding: EdgeInsets.symmetric(vertical: 35, horizontal: 20.0),
      decoration: BoxDecoration(
        color: kSidebarBackgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(34.0),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('asset/images/profile.jpg'),
                  radius: 21,
                ),
                SizedBox(width: 6.0),
                Text(
                  "Falah Hassan",
                  style: kHeadlineLabelStyle,
                ),
              ],
            ),
            SizedBox(height: deviceSize.height * .08),
            SidebarRow(item: sidebarItem[0]),
            SizedBox(height: 32),
            SidebarRow(item: sidebarItem[1]),
            SizedBox(height: 32),
            SidebarRow(item: sidebarItem[2]),
            SizedBox(height: 32),
            SidebarRow(item: sidebarItem[3]),
            SizedBox(height: 32),
            Spacer(),
            Row(
              children: [
                Image.asset("asset/icons/icon-logout.png", width: 17),
                SizedBox(width: 12),
                Text("Log out", style: kSecondaryCalloutLabelStyle),
              ],
            )
          ],
        ),
      ),
    );
  }
}
