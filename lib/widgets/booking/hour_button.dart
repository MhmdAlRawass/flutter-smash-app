import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HourButton extends StatefulWidget {
  const HourButton({
    super.key,
    required this.startTime,
    required this.bookingDuration,
  });

  final DateTime startTime;
  final void Function(int value) bookingDuration;

  @override
  State<HourButton> createState() => _HourButtonState();
}

class _HourButtonState extends State<HourButton> {
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

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Your Time of Playing',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 12),

          // ChoiceChip to display start and end time
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: ChoiceChip(
              avatar: const Icon(
                Icons.timelapse,
                color: Colors.greenAccent,
              ),
              key: ValueKey<String>(endTimeFormatted),
              showCheckmark: false,
              selectedColor:
                  Theme.of(context).colorScheme.primary.withOpacity(0.8),
              label: Text(
                '$startTimeFormatted - $endTimeFormatted',
              ),
              labelStyle: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
              selected: true,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Select Session Duration',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 20),

          ToggleButtons(
            isSelected: [
              for (int i = 0; i < durations.length; i++) i == _selectedIndex
            ],
            fillColor: theme.colorScheme.primary.withOpacity(0.9),
            selectedColor: theme.colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(20),
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            borderColor: Colors.grey.shade400,
            selectedBorderColor: theme.colorScheme.primary,
            borderWidth: 1.5,
            onPressed: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            children: durations.map((duration) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Text(
                  '$duration min',
                  style: TextStyle(
                    color: _selectedIndex == durations.indexOf(duration)
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onSurface.withOpacity(0.8),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                enableFeedback: false,
                backgroundColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.8),
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                fixedSize: const Size(
                  double.infinity,
                  50,
                ),
              ).copyWith(
                overlayColor: WidgetStateProperty.all(
                  Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                widget.bookingDuration(durations[_selectedIndex]);
              },
              child: const Text(
                'Continue',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
