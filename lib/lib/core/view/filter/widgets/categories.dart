import 'package:flutter/material.dart';

import '../../../../common/section_title.dart';
import '../../../../utils/constants.dart';

class Categories extends StatefulWidget {
  const Categories({
    super.key,
  });

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: "Categories",
          press: () {},
          isMainSection: false,
        ),
        const SizedBox(height: defaultPadding),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Wrap(
            spacing: defaultPadding / 2,
            children: List.generate(
              demoCategories.length,
              (index) => ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(56, 40),
                  backgroundColor: index == 2 ? primaryColor : bodyTextColor,
                ),
                child: Text(demoCategories[index]["title"]),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Demo data categories
  List<Map<String, dynamic>> demoCategories = [
    {"title": "All", "isActive": false},
    {"title": "Fried Chicken", "isActive": false}
  ];
}