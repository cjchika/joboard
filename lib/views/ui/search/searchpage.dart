import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
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
          suffixIcon: GestureDetector(onTap: () {
            setState(() {});
          }, child: const Icon(AntDesign.search1),),
        ),
        elevation: 0,
      ),
    );
  }
}
