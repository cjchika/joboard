import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:joboard/views/common/app_style.dart';
import 'package:joboard/views/common/height_spacer.dart';
import 'package:joboard/views/common/reusable_text.dart';
import 'package:joboard/views/common/width_spacer.dart';

import '../../constants/app_constants.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: width * 0.84,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Feather.search, color: Color(kOrange.value), size: 20.h),
                    const WidthSpacer(width: 20),
                    ReusableText(
                      text: "Search for jobs",
                      style:
                          appstyle(18, Color(kOrange.value), FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Icon(
                FontAwesome.sliders,
                color: Color(kDarkGrey.value),
                size: 20.h,
              )
            ],
          ),
          const HeightSpacer(size: 7),
          Divider(color: Color(kDarkGrey.value), thickness: 0.5, endIndent: 40.w,),
        ],
      ),
    );
  }
}
