import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joboard/views/common/drawer/drawer_srceen.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:joboard/controllers/exports.dart';
import 'package:joboard/views/common/app_style.dart';
import 'package:joboard/views/common/reusable_text.dart';
import 'package:joboard/views/common/width_spacer.dart';
import 'package:joboard/views/ui/homepage.dart';
import 'package:provider/provider.dart';

import '../../constants/app_constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ZoomNotifier>(builder: (context, zoomNotifier, child) {
      return ZoomDrawer(
        menuScreen: DrawerScreen(indexSetter: (index) {
          zoomNotifier.currentIndex = index;
        }),
        mainScreen: currentScreen(),
        borderRadius: 30,
        showShadow: true,
        angle: 0.0,
        slideWidth: 250,
        menuBackgroundColor: Color(kLightBlue.value),
      );
    });
  }

  Widget currentScreen() {
    var zoomNotifier = Provider.of(context);
    switch (zoomNotifier.currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const HomePage();
      case 2:
        return const HomePage();
      case 3:
        return const HomePage();
      default:
        return const HomePage();
    }
  }
}
