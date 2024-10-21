import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      'lib/assets/images/images-slider/tournament.jpg',
      'lib/assets/images/background.webp',
      'lib/assets/images/launcher_icon.png',
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 220,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        viewportFraction: 1,
      ),
      items: imageList.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width, // Full-width slider

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.3),
                //     spreadRadius: 3,
                //     blurRadius: 8,

                //     offset: const Offset(0, 3), // Shadow positioning
                //   ),
                // ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0), // Rounded corners
                child: Image.asset(
                  image,
                  fit: BoxFit.fill, // Ensures the image covers the container
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
