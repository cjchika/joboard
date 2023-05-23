import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:joboard/views/common/app_style.dart';
import 'package:joboard/views/common/reusable_text.dart';
import 'package:joboard/views/ui/search/widgets/custom_field.dart';

import '../../../constants/app_constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(kOrange.value),
        iconTheme: IconThemeData(color: Color(kLight.value)),
        title: CustomField(
          hintText: "Search for a role",
          controller: search,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: const Icon(AntDesign.search1),
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(children: [
          Image.asset("assets/images/optimized_search.png"),
          ReusableText(
              text: "Start searching for jobs",
              style: appstyle(20, Color(kDark.value), FontWeight.w700))
        ]),
      ),
    );
  }
}
