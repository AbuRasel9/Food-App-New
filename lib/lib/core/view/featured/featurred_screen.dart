import 'package:flutter/material.dart';
import 'package:foodly_ui/lib/core/dataModel/product/popular_product_response.dart';
import 'widgets/featured_screen_body.dart';

class FeaturedScreen extends StatelessWidget {
  final List<Product>? product;

  const FeaturedScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Featured Partners"),
      ),
      body: FeaturedScreenBody(product: product,),
    );
  }
}
