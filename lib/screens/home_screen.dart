import 'package:flutter/material.dart';
import 'package:tltdv/constants.dart';
import 'package:tltdv/screens/continue_watching_screen.dart';
import 'package:tltdv/screens/sidebar_screen.dart';
import 'package:tltdv/widgets/explore_list_course.dart';
import 'package:tltdv/widgets/home_screen_navbar.dart';
import 'package:tltdv/widgets/recent_course_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  Animation<Offset> sidebarAnimation;
  Animation<double> fadeAnimation;
  AnimationController sidebarAnimationController;
  bool sidebarHidden = true;
  @override
  void initState() {
    super.initState();
    sidebarAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    sidebarAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
        parent: sidebarAnimationController, curve: Curves.easeInOut));
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: sidebarAnimationController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    sidebarAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        width: double.infinity,
        child: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HomeScreenNavBar(triggerAnimation: () {
                      sidebarAnimationController.forward();
                      setState(() {
                        sidebarHidden = !sidebarHidden;
                      });
                    }),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Recents",
                            style: kLargeTitleStyle,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "32 corses",
                            style: kSubtitleStyle,
                          ),
                        ],
                      ),
                    ),
                    RecentCourseList(),
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Explore",
                            style: kTitle1Style,
                          ),
                          SizedBox(height: 10),
                          ExploreCoursesList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ContinueWatchingScreen(),
            IgnorePointer(
              ignoring: sidebarHidden,
              child: Stack(
                children: [
                  FadeTransition(
                    opacity: fadeAnimation,
                    child: GestureDetector(
                      onHorizontalDragStart: (_) {
                        sidebarAnimationController.reverse();
                        setState(() {
                          sidebarHidden = !sidebarHidden;
                        });
                      },
                      onTap: () {
                        sidebarAnimationController.reverse();
                        setState(() {
                          sidebarHidden = !sidebarHidden;
                        });
                      },
                      child: Container(
                        color: Color.fromRGBO(36, 38, 41, 0.4),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                  SlideTransition(
                      position: sidebarAnimation,
                      child: SafeArea(child: SidebarScreen(), bottom: false)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
