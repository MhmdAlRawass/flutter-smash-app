import 'package:flutter/material.dart';
import 'package:smash/widgets/padel/image_slider.dart';
import 'package:smash/widgets/padel/up_coming_matches.dart';

class PadelScreen extends StatelessWidget {
  const PadelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ImageSlider(),
            Container(
              padding: const EdgeInsets.all(8),
              child: const UpComingMatches(),
            ),

            //This image asset is putted only to precache the image in booking screen!
            Image.asset(
              'lib/assets/images/padel_booking.webp',
              width: 0,
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}
