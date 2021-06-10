import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tltdv/constants.dart';
import 'package:tltdv/widgets/certificate_viewer.dart';
import 'package:tltdv/widgets/completed_course_list.dart';

class ProfileScreen extends StatelessWidget {
  final List<String> badges = [
    "badge-01.png",
    "badge-02.png",
    "badge-03.png",
    "badge-04.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: kCardPopupBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(34.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, 12),
                  blurRadius: 32,
                ),
              ],
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 24.0, 20.0, 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RawMaterialButton(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          constraints: BoxConstraints(
                            maxWidth: 40.0,
                            minWidth: 40.0,
                            maxHeight: 24.0,
                          ),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Platform.isAndroid
                                    ? Icons.arrow_back
                                    : Icons.arrow_back_ios,
                                color: kSecondaryLabelColor,
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text("Profile", style: kCalloutLabelStyle),
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14.0),
                            boxShadow: [
                              BoxShadow(
                                color: kShadowColor,
                                offset: Offset(0, 12.0),
                                blurRadius: 32.0,
                              ),
                            ],
                          ),
                          child: Icon(
                            Platform.isAndroid
                                ? Icons.settings
                                : CupertinoIcons.settings_solid,
                            color: kSecondaryLabelColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Container(
                          height: 84,
                          width: 84,
                          decoration: BoxDecoration(
                            gradient: RadialGradient(
                                colors: [Color(0xff00AEFF), Color(0xff0076FF)]),
                            borderRadius: BorderRadius.circular(42.0),
                          ),
                          padding: EdgeInsets.all(6.0),
                          child: Container(
                            padding: EdgeInsets.all(6.0),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('asset/images/profile.jpg'),
                              radius: 30.0,
                            ),
                            decoration: BoxDecoration(
                              color: kBackgroundColor,
                              borderRadius: BorderRadius.circular(42.0),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Falah Hassan", style: kTitle2Style),
                            SizedBox(height: 8.0),
                            Text("Flutter Developer",
                                style: kSecondaryCalloutLabelStyle),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 28.0, bottom: 16.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Badges", style: kHeadlineLabelStyle),
                              Row(
                                children: [
                                  Text("see all",
                                      style: kSearchPlaceholderStyle),
                                  Icon(Icons.chevron_right,
                                      color: kSecondaryLabelColor),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    height: 120,
                    child: ListView.builder(
                      itemCount: badges.length,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(bottom: 28.0),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: kShadowColor.withOpacity(0.1),
                                offset: Offset(0, 12),
                                blurRadius: 18.0,
                              ),
                            ],
                          ),
                          child: Image.asset("asset/badges/${badges[index]}"),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 32.0, 20.0, 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Certificates", style: kHeadlineLabelStyle),
                Row(
                  children: [
                    Text("see all", style: kSearchPlaceholderStyle),
                    Icon(Icons.chevron_right, color: kSecondaryLabelColor),
                  ],
                ),
              ],
            ),
          ),
          CertificatViewer(),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 32.0, 20.0, 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Completed Courses", style: kHeadlineLabelStyle),
                Row(
                  children: [
                    Text("see all", style: kSearchPlaceholderStyle),
                    Icon(Icons.chevron_right, color: kSecondaryLabelColor),
                  ],
                ),
              ],
            ),
          ),
          CompleteCourseList(),
          SizedBox(height: 28.0),
        ],
      )),
    );
  }
}
