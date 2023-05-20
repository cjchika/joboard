import 'package:flutter/material.dart';
import 'package:joboard/views/common/drawer/drawer_srceen.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:joboard/controllers/exports.dart';
import 'package:joboard/views/ui/bookmarks/bookmarks.dart';
import 'package:joboard/views/ui/chat/chatpage.dart';
import 'package:joboard/views/ui/device_mgt/devices_info.dart';
import 'package:joboard/views/ui/homepage.dart';
import 'package:provider/provider.dart';

import '../../constants/app_constants.dart';
import 'auth/profile.dart';

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
        slideWidth: 200,
        menuBackgroundColor: Color(kLightBlue.value),
      );
    });
  }

  Widget currentScreen() {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);
    switch (zoomNotifier.currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const ChatsPage();
      case 2:
        return const BookMarkPage();
      case 3:
        return const DeviceManagement();
      case 4:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }
}
