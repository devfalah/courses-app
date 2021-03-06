import 'package:flutter/material.dart';
import 'package:tltdv/constants.dart';

class SidebarButton extends StatelessWidget {
  final Function triggerAnimation;

  const SidebarButton({this.triggerAnimation});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: BoxConstraints(
        maxHeight: 40.0,
        maxWidth: 40.0,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: [
            BoxShadow(
              color: kShadowColor,
              offset: Offset(0, 12),
              blurRadius: 16.0,
            ),
          ],
        ),
        child: Image.asset(
          "asset/icons/icon-sidebar.png",
          color: kPrimaryLabelColor,
        ),
      ),
      onPressed: triggerAnimation,
    );
  }
}
