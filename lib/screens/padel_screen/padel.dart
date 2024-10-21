import 'package:flutter/material.dart';
import 'package:smash/widgets/padel/image_slider.dart';
import 'package:smash/widgets/padel/location_padel.dart';
import 'package:smash/widgets/padel/up_coming_matches.dart';

class PadelScreen extends StatefulWidget {
  const PadelScreen({super.key});

  @override
  State<PadelScreen> createState() => _PadelScreenState();
}

class _PadelScreenState extends State<PadelScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: const Column(
                children: [
                  ImageSlider(),
                  UpComingMatches(),
                  SizedBox(
                    height: 12,
                  ),
                  LocationPadel(),
                ],
              ),
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
