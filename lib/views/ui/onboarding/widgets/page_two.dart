import 'package:flutter/material.dart';
import 'package:joboard/constants/app_constants.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Color(kOrange.value),
      ),
    );
  }
}