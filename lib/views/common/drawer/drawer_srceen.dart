import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:joboard/controllers/exports.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_constants.dart';

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
                1,
                zoomNotifier.currentIndex == 1
                    ? Color(kLight.value)
                    : Color(kLightGrey.value),
              ),
              drawerItem(
                Ionicons.chatbubble_outline,
                "Chat",
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
}
