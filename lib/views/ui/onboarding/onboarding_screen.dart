import 'package:flutter/material.dart';
import 'package:joboard/views/common/exports.dart';
import 'package:joboard/views/ui/onboarding/widgets/page_one.dart';
import 'package:joboard/views/ui/onboarding/widgets/page_three.dart';
import 'package:joboard/views/ui/onboarding/widgets/page_two.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: const [
              PageOne(),
              PageTwo(),
              PageThree(),
            ],
          ),
        ],
      ),
    );
  }
}
