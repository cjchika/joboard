import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joboard/constants/app_constants.dart';
import 'package:joboard/views/common/app_style.dart';
import 'package:joboard/views/common/custom_outline_btn.dart';
import 'package:joboard/views/common/height_spacer.dart';

import '../../../common/reusable_text.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Color(kLightBlue.value),
        child: Column(
          children: [
            Image.asset("assets/images/page3.png"),
            const HeightSpacer(size: 20),
            ReusableText(
              text: "Welcome To Joboard",
              style: appstyle(30, Color(kLight.value), FontWeight.w600),
            ),
            const HeightSpacer(size: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                "We help you find your dream job according to your skillset, "
                "location and preference to build your career",
                textAlign: TextAlign.center,
                style: appstyle(12, Color(kLight.value), FontWeight.normal),
              ),
            ),
            const HeightSpacer(size: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomOutlineBtn(
                  onTap: () {},
                  text: "Login",
                  width: width * 0.4,
                  height: height * 0.06,
                  color: Color(kLight.value),
                ),
                GestureDetector(
                  onTap: null,
                  child: Container(
                    width: width * 0.4,
                    height: height * 0.06,
                    color: Color(kLight.value),
                    child: Center(
                      child: ReusableText(
                          text: "Sign Up",
                          style: appstyle(
                              16, Color(kLightBlue.value), FontWeight.w600)),
                    ),
                  ),
                )
              ],
            ),
            const HeightSpacer(size: 20),
            ReusableText(
                text: "Continue as guest",
                style: appstyle(16, Color(kLight.value), FontWeight.w400))
          ],
        ),
      ),
    );
  }
}
