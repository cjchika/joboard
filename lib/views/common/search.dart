import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:joboard/views/common/app_style.dart';
import 'package:joboard/views/common/reusable_text.dart';
import 'package:joboard/views/common/width_spacer.dart';

import '../../constants/app_constants.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Feather.search, color: Color(kOrange.value), size: 20),
              const WidthSpacer(size: 20),
              ReusableText(
                text: "Search for jobs",
                style: appstyle(18, Color(kOrange.value), FontWeight.w500),
              ),

            ],
          )
        ],
      ),
    );
  }
}
