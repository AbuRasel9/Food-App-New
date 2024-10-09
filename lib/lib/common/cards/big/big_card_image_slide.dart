import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../dot_indicators.dart';
import 'big_card_image.dart';

class BigCardImageSlide extends StatefulWidget {
  const BigCardImageSlide({
    super.key,
    required this.images,
  });

  final List images;

  @override
  _BigCardImageSlideState createState() => _BigCardImageSlideState();
}

class _BigCardImageSlideState extends State<BigCardImageSlide> {
  int intialIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.81,
      child: Stack(
        children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                intialIndex = value;
              });
            },
            itemCount: 10,
            itemBuilder: (context, index) =>
                BigCardImage(image: "https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg"),
          ),
          Positioned(
            bottom: defaultPadding,
            right: defaultPadding,
            child: Row(
              children: List.generate(
                widget.images.length,
                (index) => DotIndicator(
                  isActive: intialIndex == index,
                  activeColor: Colors.white,
                  inActiveColor: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
