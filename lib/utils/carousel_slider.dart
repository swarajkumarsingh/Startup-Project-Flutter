import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:starter_project_flutter/constants/constants.dart';

class CustomCarouselSlider extends StatelessWidget {
  final List list;
  const CustomCarouselSlider({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: list.length,
      options: CarouselOptions(
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(seconds: 3),
        enlargeCenterPage: true,
        viewportFraction: 1,
      ),
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return CustomBanner(
          imageUrl: list[itemIndex],
        );
      },
    );
  }
}

class CustomBanner extends StatelessWidget {
  final String imageUrl;
  const CustomBanner({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.network(
          imageUrl,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
