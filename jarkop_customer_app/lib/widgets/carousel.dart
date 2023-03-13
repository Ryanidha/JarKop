import 'package:flutter/material.dart';

class HorizontalCarousel extends StatelessWidget {
  final List<String> items;
  final double height;
  final double width;
  final double carouselHeight;

  HorizontalCarousel(
      {required this.items,
      this.carouselHeight = 200,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: carouselHeight,
      child: PageView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: height,
            width: width,
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Card(
              child: Center(
                child: Text(items[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
