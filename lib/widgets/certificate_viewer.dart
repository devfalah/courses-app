import 'dart:math';

import 'package:flutter/material.dart';

class CertificatViewer extends StatefulWidget {
  @override
  _CertificatViewerState createState() => _CertificatViewerState();
}

class _CertificatViewerState extends State<CertificatViewer> {
  List<String> certificatePaths = [
    "asset/certificates/certificate-01.png",
    "asset/certificates/certificate-02.png",
    "asset/certificates/certificate-03.png",
  ];
  List<Widget> imageChildren = [];
  @override
  void initState() {
    certificatePaths.reversed.toList().asMap().forEach((index, value) {
      int angel;
      if (index == certificatePaths.length - 1) {
        angel = 0;
      } else {
        angel = Random().nextInt(10) - 5;
      }
      imageChildren.add(
        Transform.rotate(
          angle: angel * (pi / 180),
          child: Image.asset(
            value,
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Stack(
        children: imageChildren,
      ),
    );
  }
}
