import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConfirmBooking extends StatelessWidget {
  const ConfirmBooking({
    super.key,
    required this.date,
    required this.duration,
    required this.bookingState,
  });

  final DateTime date;
  final int duration;
  final void Function() bookingState;

  @override
  Widget build(BuildContext context) {
    final specificDayName = DateFormat('EE').format(date);
    final specificDayOfMonth = date.day;
    final startTime = DateFormat('jm').format(date);
    final endTime = date.add(
      Duration(
        minutes: duration,
      ),
    );
    final endTimeFormatted = DateFormat('jm').format(endTime);
    double price = 20.00;

    // Define prices
    if (duration == 90) {
      price = 32.00;
    } else if (duration == 120) {
      price = 40.00;
    }

    return Dialog(
      insetPadding: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('lib/assets/images/background.webp'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(children: [
              ImageIcon(
                const AssetImage('lib/assets/icons/padel.webp'),
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                'Padel',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ]),
            Row(
              children: [
                Icon(
                  Icons.timelapse,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '$specificDayName ${specificDayOfMonth.toString()} | $startTime - $endTimeFormatted',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                ImageIcon(
                  const AssetImage(
                    'lib/assets/icons/money.webp',
                  ),
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '${price.toStringAsFixed(2)} \$',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    bookingState();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: Text(
                    'Book',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
