import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smash/screens/padel_screen/booking_information.dart';

class UpComingMatches extends StatelessWidget {
  const UpComingMatches({super.key});

  @override
  Widget build(BuildContext context) {
    bool isBooked = true;

    Widget activeCard = SizedBox(
      height: 230,
      width: double.infinity,
      child: Card(
        elevation: 4,
        color: const Color.fromARGB(255, 213, 213, 213),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.center_focus_weak_outlined,
              size: 28,
            ),
            const SizedBox(
              height: 12,
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: '\t\t\t\tYou have no upcoming\n ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: 'bookings in your schedule',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    //If there is any booking change card info

    if (isBooked) {
      DateTime todayDate = DateTime.now();
      final specificDayName = DateFormat('EE').format(todayDate);
      final specificDayOfMonth = todayDate.day;
      final startTime = DateFormat('jm').format(todayDate);
      final endTime = todayDate.add(const Duration(minutes: 60));
      final endTimeFormatted = DateFormat('jm').format(endTime);
      double price = 20.00;

      activeCard = GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) {
                return const BookingInformation();
              },
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(
                'lib/assets/images/background.webp',
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'UserName... ',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
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
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
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
            ],
          ),
        ),
      );
    }

    //
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Upcoming Matches',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(48, 158, 158, 158),
                ),
                child: const Text(
                  'All',
                  style: TextStyle(
                    color: Color.fromARGB(255, 109, 109, 109),
                  ),
                ),
              )
            ],
          ),
        ),
        activeCard,
      ],
    );
  }
}