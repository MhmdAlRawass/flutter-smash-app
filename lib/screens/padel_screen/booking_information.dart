import 'package:flutter/material.dart';
import 'package:smash/widgets/tabs/app_bar.dart';

class BookingInformation extends StatelessWidget {
  const BookingInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: TabsAppBar(
          page: 0,
          onPressedBackward: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const WarningMessage(),
              // Details Screen
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        buildDetailRow('Date: ', '12/18/22'),
                        buildDetailRow('Schedule: ', '8 - 9 AM'),
                        buildDetailRow('Booking No: ', '452856965',
                            isLink: true),
                        buildDetailRow(
                            'Description: ', 'Booking at Smash Padel Court'),
                        buildDetailRow('Details: ', 'Name + 3'),
                      ],
                    ),
                  ),
                ),
              ),

              // Action Buttons Wrap
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  buildActionButton(
                      Icons.call, 'CALL CENTER', () {}, context, false),
                  buildActionButton(Icons.calendar_month_outlined,
                      'ADD TO CALENDAR', () {}, context, false),
                  buildActionButton(Icons.delete_outline, 'CANCEL BOOKING',
                      () {}, context, true),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WarningMessage extends StatelessWidget {
  const WarningMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        color: Colors.redAccent,
      ),
      child: Row(
        children: [
          Icon(
            Icons.warning_amber_outlined,
            color: Theme.of(context).colorScheme.onPrimary,
            size: 28,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Pending payment!',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildDetailRow(String label, String value, {bool isLink = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        isLink
            ? GestureDetector(
                onTap: () {},
                child: Text(
                  value,
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              )
            : Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
      ],
    ),
  );
}

Widget buildActionButton(
  IconData icon,
  String label,
  VoidCallback onPressed,
  BuildContext context,
  bool isDelete,
) {
  // Calculate button size based on screen width
  double screenWidth = MediaQuery.of(context).size.width;
  double buttonWidth =
      screenWidth * 0.25; // Adjust width dynamically based on screen size
  double buttonHeight =
      buttonWidth * 0.67; // Maintain aspect ratio for the button

  return InkWell(
    onTap: onPressed,
    borderRadius: BorderRadius.circular(16),
    child: Container(
      width: buttonWidth, // Dynamic width
      height: buttonHeight, // Dynamic height
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 0.8,
          color: isDelete ? Colors.red : Colors.grey,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: buttonHeight * 0.25, // Adjust icon size based on height
            color:
                isDelete ? Colors.red : Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            maxLines: 2,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: buttonHeight * 0.15, // Adjust text size dynamically
              color: isDelete ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    ),
  );
}
