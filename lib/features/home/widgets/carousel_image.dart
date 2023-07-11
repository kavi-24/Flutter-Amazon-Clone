import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map(
        (i) {
          return Builder(
            builder: (BuildContext context) =>
                // Container(
                //   margin: const EdgeInsets.symmetric(horizontal: 5),
                //   child:
                Image.network(
              i,
              fit: BoxFit.cover,
              height: 150,
            ),
            // ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        // viewportFraction: 0.8,
        viewportFraction: 1,
        height: 150,
      ),
    );
  }
}
