import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:joboard/controllers/exports.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_constants.dart';
import '../app_style.dart';
import '../reusable_text.dart';
import '../width_spacer.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key, required this.indexSetter});

  final ValueSetter indexSetter;

  @override
  State<StatefulWidget> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ZoomNotifier>(builder: (context, zoomNotifier, child) {
      return GestureDetector(
        onDoubleTap: () {
          ZoomDrawer.of(context)!.toggle();
        },
        child: Scaffold(
          backgroundColor: Color(kLightBlue.value),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              drawerItem(
                AntDesign.home,
                "Home",
                0,
                zoomNotifier.currentIndex == 0
                    ? Color(kLight.value)
                    : Color(kLightGrey.value),
              ),
              drawerItem(
                Ionicons.chatbubble_outline,
                "Chat",
                1,
                zoomNotifier.currentIndex == 1
                    ? Color(kLight.value)
                    : Color(kLightGrey.value),
              ),
              drawerItem(
                Ionicons.bookmarks_outline,
                "Bookmarks",
                2,
                zoomNotifier.currentIndex == 2
                    ? Color(kLight.value)
                    : Color(kLightGrey.value),
              ),
              drawerItem(
                MaterialCommunityIcons.devices,
                "Device Mgt",
                3,
                zoomNotifier.currentIndex == 3
                    ? Color(kLight.value)
                    : Color(kLightGrey.value),
              ),
              drawerItem(
                FontAwesome5Regular.user_circle,
                "Profile",
                4,
                zoomNotifier.currentIndex == 4
                    ? Color(kLight.value)
                    : Color(kLightGrey.value),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget drawerItem(IconData icon, String text, int index, Color color) {
    return GestureDetector(
      onTap: () {
        widget.indexSetter(index);
      },
      child: Container(
        margin: EdgeInsets.only(left: 20.w, bottom: 20.h),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
            ),
            const WidthSpacer(size: 12),
            ReusableText(
              text: text,
              style: appstyle(12, color, FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
