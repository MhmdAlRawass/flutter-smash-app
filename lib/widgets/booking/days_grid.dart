import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DaysGrid extends StatefulWidget {
  const DaysGrid({
    super.key,
    required this.date,
    required this.isSelected,
    required this.onTap,
  });

  final DateTime date;
  final bool isSelected;
  final void Function() onTap;

  @override
  State<DaysGrid> createState() => _DaysGridState();
}

class _DaysGridState extends State<DaysGrid> {
  @override
  Widget build(BuildContext context) {
    bool isPressed = widget.isSelected;
    String dayName = DateFormat('EE').format(widget.date);
    int dayInt = widget.date.day;
    String monthName = DateFormat('MMM').format(widget.date);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: !isPressed
              ? [
                  const Color(0xCCF5F5F5),
                  const Color(0xCCBDBDBD),
                ]
              : [
                  const Color.fromARGB(157, 245, 245, 245),
                  const Color.fromARGB(138, 189, 189, 189)
                ],
        ),
        //  isPressed
        //     ? Theme.of(context).colorScheme.primary.withOpacity(0.8)
        //     : Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(
          isPressed ? 15 : 10,
        ),
        border: Border.all(width: 0.5, color: const Color(0xCCBDBDBD)),
      ),
      child: InkWell(
        onTap: widget.onTap,
        splashColor: Colors.blueAccent.withOpacity(0.3),
        highlightColor: Colors.blue.withOpacity(0.1),
        splashFactory: InkRipple.splashFactory,
        enableFeedback: false,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: dayName,
                  style: TextStyle(
                    color: isPressed ? Colors.white : Colors.black,
                  ),
                ),
                TextSpan(
                  text: '\n${dayInt.toString()}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isPressed ? Colors.white : Colors.black,
                  ),
                ),
                TextSpan(
                  text: '\n$monthName',
                  style: TextStyle(
                    color: isPressed ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
