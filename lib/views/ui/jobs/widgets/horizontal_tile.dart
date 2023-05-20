import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joboard/constants/app_constants.dart';
import 'package:joboard/views/common/exports.dart';
import 'package:joboard/views/common/height_spacer.dart';
import 'package:joboard/views/common/width_spacer.dart';

class JobHorizontalTile extends StatelessWidget {
  const JobHorizontalTile({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          width: width * 0.7,
          height: height * 0.27,
          color: Color(kLightGrey.value),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/user.png"),
                  ),
                  const WidthSpacer(width: 15),
                  ReusableText(
                    text: "Google",
                    style: appstyle(24, Color(kDark.value), FontWeight.w600),
                  ),
                ],
              ),
              const HeightSpacer(size: 10),
              ReusableText(
                text: "Senior Flutter Developer",
                style: appstyle(18, Color(kDark.value), FontWeight.w600),
              ),
              const HeightSpacer(size: 10),
              ReusableText(
                text: "Washington DC",
                style: appstyle(16, Color(kDarkGrey.value), FontWeight.w600),
              ),
              const HeightSpacer(size: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(

                    children: [
                      ReusableText(
                        text: "15k",
                        style: appstyle(18, Color(kDark.value), FontWeight.w600),
                      ),
                      ReusableText(
                        text: "/monthly",
                        style: appstyle(18, Color(kDarkGrey.value), FontWeight.w600),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(kLight.value),
                    child: const Icon(Icons.chevron_right),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
