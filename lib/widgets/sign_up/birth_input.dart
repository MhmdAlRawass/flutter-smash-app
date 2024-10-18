import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BirthInput extends StatefulWidget {
  const BirthInput({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<BirthInput> createState() => _BirthInputState();
}

class _BirthInputState extends State<BirthInput> {
  DateTime? _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (_selectedDate != null) {
      widget.controller.text = DateFormat('dd/MM/yyyy').format(_selectedDate!);
    } else {
      widget.controller.text = 'Select Date';
    }
  }

  // Function to call the date picker
  Future<void> _selectDate() async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 100),
      lastDate: now,
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.controller.text =
            DateFormat('dd/MM/yyyy').format(_selectedDate!);
      });
    }

    if (picked == null) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(146, 222, 221, 221),
      ),
      padding: const EdgeInsets.only(left: 12, top: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date of Birth',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 0,
                ),
                TextFormField(
                  controller: widget.controller,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(
                      left: 12,
                      bottom: 20,
                      top: 4,
                      right: 6,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                  readOnly: true,
                  autocorrect: false,
                  enableSuggestions: false,
                  onTap: () {
                    _selectDate();
                  },
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              _selectDate();
            },
            icon: const ImageIcon(
              AssetImage('lib/assets/icons/calendar.webp'),
              size: 24,
            ),
          )
        ],
      ),
    );
  }
}
