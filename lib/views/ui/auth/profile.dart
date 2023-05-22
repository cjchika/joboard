import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joboard/constants/app_constants.dart';
import 'package:joboard/views/common/app_style.dart';
import 'package:joboard/views/common/reusable_text.dart';
import 'package:joboard/views/common/width_spacer.dart';

import '../../common/app_bar.dart';
import '../../common/drawer/draw_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: "Profile",
          child: Padding(
            padding: EdgeInsets.all(12.0.h),
            child: const DrawerWidget(),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            width: width,
            height: height * 0.12,
            color: Color(kLight.value),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: CachedNetworkImage(
                    width: 80.w,
                    height: 100.h,
                    imageUrl:
                        "https://gcavocats.ca/wp-content/uploads/2018/09/man-avatar-icon-flat-vector-19152370-1.jpg",
                  ),
                ),
                const WidthSpacer(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: "John Doe",
                      style: appstyle(20, Color(kDark.value), FontWeight.w600),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
