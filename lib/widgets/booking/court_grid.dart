import 'package:flutter/material.dart';
import 'package:smash/widgets/booking/confirm_booking.dart';
import 'package:smash/widgets/booking/modal_sheet_content.dart';
import 'package:smash/widgets/booking/time_slot.dart';

class CourtGrid extends StatefulWidget {
  const CourtGrid({
    super.key,
    required this.day,
  });

  final DateTime day;

  @override
  State<CourtGrid> createState() => _CourtGridState();
}

class _CourtGridState extends State<CourtGrid> with TickerProviderStateMixin {
  List<DateTime> bookedSlots = [];

  @override
  Widget build(BuildContext context) {
    // Function to generate time slots from 8:00 AM to 12:30 AM
    List<DateTime> _generateTimeSlots() {
      int year = widget.day.year;
      int month = widget.day.month;
      int dayTime = widget.day.day;
      int nextDay = widget.day.add(const Duration(days: 1)).day;

      DateTime startTime =
          DateTime(year, month, dayTime, 8, 0); // Start at 8:00 AM
      DateTime endTime =
          DateTime(year, month, nextDay, 1, 0); // End at 12:30 AM next day

      List<DateTime> timeSlots = [];
      while (startTime.isBefore(endTime)) {
        timeSlots.add(startTime);
        startTime = startTime
            .add(const Duration(minutes: 30)); // Add 30 minutes interval
      }
      return timeSlots;
    }

    // Determine if the selected day is today
    bool isToday = widget.day.year == DateTime.now().year &&
        widget.day.month == DateTime.now().month &&
        widget.day.day == DateTime.now().day;

    // If the selected day is today, filter time slots to show only times after the current time
    List<DateTime> availableTimeSlots;
    if (isToday) {
      availableTimeSlots = _generateTimeSlots()
          .where((slot) => slot.isAfter(DateTime.now()))
          .toList();
    } else {
      // If a future day is selected, show all time slots
      availableTimeSlots = _generateTimeSlots();
    }

    void setBookingState(int bookingDuration, DateTime time) {
      int slotCount = bookingDuration ~/ 30;

      for (int i = 0; i <= slotCount; i++) {
        DateTime slotToAdd = time.add(Duration(minutes: 30 * i));
        if (!bookedSlots.contains(slotToAdd)) {
          setState(() {
            bookedSlots.add(slotToAdd);
          });
        }
      }
    }

    void showModalSheet(DateTime time) {
      showModalBottomSheet(
        context: context,
        isDismissible: true,
        transitionAnimationController: AnimationController(
          duration: const Duration(milliseconds: 1000),
          reverseDuration: const Duration(milliseconds: 500),
          vsync: this,
        )..forward(),
        builder: (ctx) {
          return ModalSheetContent(
            slot: time,
            bookingDuration: (value) {
              // Before Set booking State we should overlay confirmation

              showDialog(
                context: context,
                builder: (ctx) {
                  return ConfirmBooking(
                    date: time,
                    duration: value,
                    bookingState: () {
                      setBookingState(value, time);
                    },
                  );
                },
              );
            },
          );
        },
      );
    }

    // Calculate available height
    double availableHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        150; // Adjust this value based on the height of other widgets above the card

    bool isOverFlow = availableTimeSlots.length > 12;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.sports_tennis),
                SizedBox(width: 12),
                Text(
                  'Smash Padel Court',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Use SizedBox for the available height before the Card
            if (isOverFlow)
              SizedBox(
                height: availableHeight - 160,
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 10, // Horizontal space between items
                    runSpacing: 10, // Vertical space between rows
                    children: availableTimeSlots.map((slot) {
                      bool isBooked = bookedSlots.contains(slot);
                      return SizedBox(
                        width: (MediaQuery.of(context).size.width / 3) -
                            28, // Adjust width based on screen size and padding
                        child: InkWell(
                          onTap: isBooked
                              ? null
                              : () {
                                  showModalSheet(slot);
                                },
                          enableFeedback: false,
                          child: TimeSlot(
                            slot: slot,
                            isBooked: isBooked,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            if (!isOverFlow)
              SingleChildScrollView(
                child: Wrap(
                  spacing: 10, // Horizontal space between items
                  runSpacing: 10, // Vertical space between rows
                  children: availableTimeSlots.map((slot) {
                    bool isBooked = bookedSlots.contains(slot);
                    return SizedBox(
                      width: (MediaQuery.of(context).size.width / 3) -
                          28, // Adjust width based on screen size and padding
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: isBooked
                            ? null
                            : () {
                                showModalSheet(slot);
                              },
                        enableFeedback: false,
                        child: TimeSlot(
                          slot: slot,
                          isBooked: isBooked,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
