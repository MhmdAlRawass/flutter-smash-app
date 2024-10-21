import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomHourSelection extends StatefulWidget {
  const CustomHourSelection({
    super.key,
    required this.startTime,
    required this.onDurationSelected,
  });

  final DateTime startTime;
  final void Function(int value) onDurationSelected;

  @override
  State<CustomHourSelection> createState() => _CustomHourSelectionState();
}

class _CustomHourSelectionState extends State<CustomHourSelection> {
  int _selectedIndex = 0;
  final List<int> durations = [60, 90, 120];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Calculate start and end times based on the selected duration
    DateTime startTime = widget.startTime;
    String startTimeFormatted = DateFormat('jm').format(startTime);
    DateTime endTime =
        startTime.add(Duration(minutes: durations[_selectedIndex]));
    String endTimeFormatted = DateFormat('jm').format(endTime);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Select Your Time Slot',
            style: theme.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          // Display selected time
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.colorScheme.primary),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$startTimeFormatted - $endTimeFormatted',
                  style: theme.textTheme.titleLarge,
                ),
                const Icon(
                  Icons.timelapse,
                  color: Colors.greenAccent,
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          Text(
            'Choose Session Duration',
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),

          // Card-based Toggle Buttons
          Wrap(
            spacing: 12,
            children: List.generate(durations.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Card(
                  color: _selectedIndex == index
                      ? theme.colorScheme.primary
                      : theme.colorScheme.surface,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 20,
                    ),
                    child: Text(
                      '${durations[index]} min',
                      style: TextStyle(
                        color: _selectedIndex == index
                            ? theme.colorScheme.onPrimary
                            : theme.colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 30),

          // Continue button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                widget.onDurationSelected(durations[_selectedIndex]);
              },
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
