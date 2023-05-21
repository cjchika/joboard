import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:joboard/constants/app_constants.dart';
import 'package:joboard/views/common/app_bar.dart';
import 'package:joboard/views/common/custom_outline_btn.dart';
import 'package:joboard/views/common/exports.dart';
import 'package:joboard/views/common/height_spacer.dart';

class JobPage extends StatefulWidget {
  const JobPage({super.key, required this.title, required this.id});

  final String title;
  final String id;

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: widget.title,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 13),
              child: Icon(Icons.bookmark_add_rounded),
            )
          ],
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(CupertinoIcons.arrow_left),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.zero,
              children: [
                const HeightSpacer(size: 30),
                Container(
                  width: width,
                  height: height * 0.27,
                  color: Color(kLightGrey.value),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/user.png"),
                      ),
                      const HeightSpacer(size: 10),
                      ReusableText(
                        text: "Senior Flutter Developer",
                        style:
                            appstyle(22, Color(kDark.value), FontWeight.w600),
                      ),
                      const HeightSpacer(size: 5),
                      ReusableText(
                        text: "Abuja, Nigeria",
                        style: appstyle(
                            16, Color(kDarkGrey.value), FontWeight.normal),
                      ),
                      const HeightSpacer(size: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomOutlineBtn(
                                width: width * 0.26,
                                height: height * 0.04,
                                color2: Color(kLight.value),
                                text: "Full-time",
                                onTap: () {},
                                color: Color(kOrange.value)),
                            Row(
                              children: [
                                ReusableText(
                                  text: "10k",
                                  style: appstyle(
                                      18, Color(kDark.value), FontWeight.w600),
                                ),
                                SizedBox(
                                  width: width * 0.2,
                                  child: ReusableText(
                                    text: "/monthly",
                                    style: appstyle(16, Color(kDark.value),
                                        FontWeight.w600),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const HeightSpacer(size: 20),
                ReusableText(
                  text: "Job Description",
                  style: appstyle(20, Color(kDark.value), FontWeight.w600),
                ),
                const HeightSpacer(size: 20),
                Text(
                  desc,
                  textAlign: TextAlign.justify,
                  maxLines: 8,
                  style:
                      appstyle(16, Color(kDarkGrey.value), FontWeight.normal),
                ),
                const HeightSpacer(size: 20),
                ReusableText(
                  text: "Requirements",
                  style: appstyle(20, Color(kDark.value), FontWeight.w600),
                ),
                const HeightSpacer(size: 20),
                SizedBox(
                  height: height * 0.6,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                      itemCount: requirements.length,
                      itemBuilder: (context, index) {
                        final req = requirements[index];
                        String bullet = "\u2022";
                        return Text(
                          "$bullet $req\n",
                          maxLines: 4,
                          textAlign: TextAlign.justify,
                          style: appstyle(
                              16, Color(kDarkGrey.value), FontWeight.normal),
                        );
                      }),
                ),
                const HeightSpacer(size: 20),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: CustomOutlineBtn(
                  width: width,
                  height: height * 0.06,
                  text: "Apply Now",
                  onTap: () {},
                  color2: Color(kOrange.value),
                  color: Color(kLight.value),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
