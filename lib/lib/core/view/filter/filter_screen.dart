import 'package:flutter/material.dart';
import 'package:foodly_ui/lib/core/view/filter/widgets/categories.dart';
import '../../../utils/constants.dart';
import 'widgets/dietaries.dart';
import 'widgets/price_range.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: defaultPadding),
              Categories(),
              SizedBox(height: defaultPadding),
              Dietaries(),
              SizedBox(height: defaultPadding),
              PriceRange(),
              SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}
