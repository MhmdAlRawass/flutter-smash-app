import 'package:flutter/material.dart';

import 'package:smash/widgets/booking/court_grid.dart';
import 'package:smash/widgets/booking/days_grid.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() {
    return _BookingScreenState();
  }
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now().add(const Duration(days: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      body: Flex(
        direction: Axis.vertical,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 0.5,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 270,
                  child: Stack(
                    children: [
                      const Image(
                        image:
                            AssetImage('lib/assets/images/padel_booking.webp'),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Positioned(
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8,
                            bottom: 8,
                          ),
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: List.generate(
                              4,
                              (i) => Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: DaysGrid(
                                  date: DateTime.now().add(Duration(days: i)),
                                  isSelected: _selectedDate!.day ==
                                      DateTime.now().add(Duration(days: i)).day,
                                  onTap: () {
                                    setState(
                                      () {
                                        if (_selectedDate!.day ==
                                            DateTime.now()
                                                .add(Duration(days: i))
                                                .day) {
                                          return;
                                        } else {
                                          _selectedDate = DateTime.now()
                                              .add(Duration(days: i));
                                        }
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CourtGrid(
            day: _selectedDate!,
          ),
        ],
      ),
    );
  }
}
