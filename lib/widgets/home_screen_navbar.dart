import 'package:flutter/material.dart';
import 'package:tltdv/screens/profile_screen.dart';
import 'package:tltdv/widgets/search_field.dart';
import 'package:tltdv/widgets/sidebar_button.dart';

class HomeScreenNavBar extends StatelessWidget {
  final Function triggerAnimation;

  const HomeScreenNavBar({this.triggerAnimation});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SidebarButton(
            triggerAnimation: triggerAnimation,
          ),
          SearchField(),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ProfileScreen()));
            },
            child: CircleAvatar(
              backgroundImage: AssetImage('asset/images/profile.jpg'),
              radius: 18,
            ),
          ),
        ],
      ),
    );
  }
}
