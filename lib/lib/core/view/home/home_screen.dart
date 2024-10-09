import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:foodly_ui/lib/core/provider/product_provider.dart';
import 'package:foodly_ui/lib/core/view/auth/widgets/sign_in_form.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../common/cards/big/big_card_image_slide.dart';
import '../../../common/cards/big/restaurant_info_big_card.dart';
import '../../../common/section_title.dart';
import '../../../utils/constants.dart';
import '../../../utils/demoData.dart';
import '../details/details_screen.dart';
import '../featured/featurred_screen.dart';
import 'widgets/medium_card_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void fetchPopularProduct() async {
    final productProvider = context.read<ProductProvider>();
    productProvider.setLoading(value: true);
    await productProvider.getProductList();
    productProvider.setLoading(value: false);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        fetchPopularProduct();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9999.0),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.network(
                'https://www.ilovejapantours.com/images/easyblog_articles/6/doraemon-gadget-cat-from-the-future-wallpaper-4.jpg',
              ),
            ),
          ),
        ),
        title: const Text("Home Screen"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: defaultPadding),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: BigCardImageSlide(images: demoBigImages),
              ),
              const SizedBox(height: defaultPadding * 2),
              SectionTitle(
                title: "Featured Partners",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeaturedScreen(
                      product: productProvider.productList,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              Text(
                "POPULAR PRODUCT",
                style: theme.textTheme.titleLarge,
              ),
               PopularProduct(product: productProvider.productList ?? [],),
              const SizedBox(height: 20),
              // Banner
              // const PromotionBanner(), หน้าโปรโมชั่น
              const SizedBox(height: 20),
              SectionTitle(
                title: "Best Pick",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FeaturedScreen(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
               PopularProduct(product: productProvider.productList ?? [],),
              const SizedBox(height: 20),
              SectionTitle(title: "All Restaurants", press: () {}),
              const SizedBox(height: 16),

              // Demo list of Big Cards
              Column(
                children: demoMediumCardData.map((restaurant) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(
                        defaultPadding, 0, defaultPadding, defaultPadding),
                    child: RestaurantInfoBigCard(
                      // Use demoBigImages list
                      images: [restaurant["image"]],
                      // Use demoRestaurantNames list for name
                      name: restaurant["name"],
                      rating: restaurant["rating"],
                      numOfRating: 200,
                      deliveryTime: restaurant["delivertTime"],
                      foodType: const ["Fried Chicken"],
                      press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailsScreen(),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
