import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:joboard/controllers/exports.dart';
import 'package:joboard/views/common/drawer/drawer_srceen.dart';
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

  }
}


