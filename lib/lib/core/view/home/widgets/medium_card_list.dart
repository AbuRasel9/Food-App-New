import 'package:flutter/material.dart';
import 'package:foodly_ui/lib/core/dataModel/product/popular_product_response.dart';
import '../../../../common/cards/medium/restaurant_info_medium_card.dart';
import '../../../../common/scalton/medium_card_scalton.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/demoData.dart';
import '../../details/details_screen.dart';

class PopularProduct extends StatefulWidget {
  final List<Product> product;
  const PopularProduct({
    super.key, required this.product,
  });

  @override
  _PopularProductState createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {


  @override
  Widget build(BuildContext context) {
    // only for demo
    List data = demoMediumCardData..shuffle();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 254,
          child:  ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.product.length ?? 0,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                      left: defaultPadding,
                      right: (data.length - 1) == index ? defaultPadding : 0,
                    ),
                    child: RestaurantInfoMediumCard(
                      image:/* widget.product[index].img ?? ""*/"https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg",
                      name: widget.product[index].name ?? "",
                      location:widget.product[index].location ?? "",
                      delivertTime: 25,
                      rating: 4.6,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailsScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  SingleChildScrollView buildFeaturedPartnersLoadingIndicator() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          2,
          (index) => const Padding(
            padding: EdgeInsets.only(left: defaultPadding),
            child: MediumCardScalton(),
          ),
        ),
      ),
    );
  }
}
