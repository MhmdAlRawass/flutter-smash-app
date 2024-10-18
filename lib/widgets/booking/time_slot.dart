import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeSlot extends StatelessWidget {
  const TimeSlot({
    super.key,
    required this.slot,
    required this.isBooked,
  });

  final DateTime slot;
  final bool isBooked;

  @override
  Widget build(BuildContext context) {
    final formattedTime = DateFormat('h:mm a').format(slot);

    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey.shade200],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            formattedTime,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: isBooked ? Colors.grey : Colors.black87,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                color: isBooked ? Colors.redAccent : Colors.greenAccent,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: isBooked
                        ? Colors.redAccent.withOpacity(0.5)
                        : Colors.greenAccent.withOpacity(0.5),
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
