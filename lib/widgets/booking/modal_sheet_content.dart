import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  int _selectedDurationIndex = 0;
  final List<int> _durations = [60, 90, 120]; // Duration options in minutes

  @override
  Widget build(BuildContext context) {
    // Format the selected time slot for display
    String formattedSlot = DateFormat('jm').format(widget.slot);
    DateTime endTime = widget.slot.add(
      Duration(
        minutes: _durations[_selectedDurationIndex],
      ),
    );
    String endTimeFormatted = DateFormat('jm').format(endTime);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      // height: MediaQuery.of(context).size.height *
      //     0.7, // Increased height for more content
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Drag handle
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
            const SizedBox(height: 20),

            // Title
            Text(
              'Smash Padel Court',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Selected Time Slot Display
            Container(
              width: MediaQuery.of(context).size.width - 128,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 0.25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$formattedSlot - $endTimeFormatted',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const Icon(Icons.timelapse, color: Colors.greenAccent)
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Instruction Text
            Row(
              children: [
                Text(
                  'Select Your Booking Duration',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Duration Selection
            Wrap(
              spacing: 12,
              alignment: WrapAlignment.center,
              children: List.generate(_durations.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDurationIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                    decoration: BoxDecoration(
                      color: _selectedDurationIndex == index
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: _selectedDurationIndex == index
                          ? [
                              const BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 4),
                                blurRadius: 8,
                              ),
                            ]
                          : [],
                    ),
                    child: Text(
                      '${_durations[index]} min',
                      style: TextStyle(
                        color: _selectedDurationIndex == index
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),

            // Continue Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  widget.bookingDuration(_durations[_selectedDurationIndex]);
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
