import 'package:flutter/material.dart';

class DeviceInfo extends StatelessWidget {
  const DeviceInfo({
    super.key,
    required this.location,
    required this.device,
    required this.platform,
    required this.date,
    required this.ipAddress,
  });

  final String location;
  final String device;
  final String platform;
  final String date;
  final String ipAddress;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}





