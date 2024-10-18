import 'package:flutter/material.dart';
import 'package:smash/widgets/booking/hour_button.dart';

class ModalSheetContent extends StatefulWidget {
  const ModalSheetContent({
    super.key,
    required this.slot,
    required this.bookingDuration,
  });

  final DateTime slot;
  final void Function(int value) bookingDuration;

  @override
  State<ModalSheetContent> createState() => _ModalSheetContentState();
}

class _ModalSheetContentState extends State<ModalSheetContent> {
  String selectedHour = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.6,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Smash Padel Court',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            HourButton(
              startTime: widget.slot,
              bookingDuration: widget.bookingDuration,
            ),
          ],
        ),
      ),
    );
  }
}
