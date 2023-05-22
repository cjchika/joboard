import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:joboard/controllers/exports.dart';
import 'package:joboard/views/common/app_style.dart';
import 'package:joboard/views/common/exports.dart';
import 'package:joboard/views/common/height_spacer.dart';
import 'package:joboard/views/ui/device_mgt/widgets/device_info.dart';
import 'package:joboard/views/ui/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_constants.dart';
import '../../common/app_bar.dart';
import '../../common/drawer/draw_widget.dart';

class DeviceManagement extends StatelessWidget {
  const DeviceManagement({super.key});

  @override
  Widget build(BuildContext context) {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);
    var onBoardNotifier = Provider.of<OnBoardNotifier>(context);

    String date = DateTime.now().toString();
    String loginDate = date.substring(0, 11);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: "Device Management",
          child: Padding(
            padding: EdgeInsets.all(12.0.h),
            child: const DrawerWidget(),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeightSpacer(size: 50),
                  Text(
                    "You are logged in into your account on these devices.",
                    style: appstyle(16, Color(kDark.value), FontWeight.normal),
                  ),
                  const HeightSpacer(size: 50),
                  DeviceInfo(
                    location: "Abuja NG",
                    device: "MacBook M2",
                    platform: "Web Client",
                    date: loginDate,
                    ipAddress: "16.0.13.000",
                  ),
                  const HeightSpacer(size: 45),
                  DeviceInfo(
                    location: "Abia NG",
                    device: "iPhone 14 Pro Max",
                    platform: "Mobile",
                    date: loginDate,
                    ipAddress: "17.0.12.000",
                  ),
                ],
              ),
            ),
           Consumer<LoginNotifier>(builder: (context, loginNotifier, child) {
             return  Padding(
               padding: EdgeInsets.all(8.0.h),
               child: GestureDetector(
                 onTap: () {
                   zoomNotifier.currentIndex = 0;
                   onBoardNotifier.isLastPage = false;
                   Get.to(() => const OnBoardingScreen());
                 },
                 child: Align(
                   alignment: Alignment.bottomCenter,
                   child: ReusableText(
                     text: "Sign Out On All Devices",
                     style: appstyle(16, Color(kOrange.value), FontWeight.w600),
                   ),
                 ),
               ),
             );
           })
          ],
        ),
      ),
    );
  }
}
