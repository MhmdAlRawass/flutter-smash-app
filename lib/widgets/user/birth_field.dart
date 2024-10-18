import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BirthFieldUser extends StatefulWidget {
  const BirthFieldUser({super.key});

  @override
  State<BirthFieldUser> createState() => _BirthFieldUserState();
}

class _BirthFieldUserState extends State<BirthFieldUser> {
  final TextEditingController controller = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    // Initialize the controller with the current date in the preferred format
    controller.text = DateFormat('dd/MM/yyyy').format(_selectedDate!);
  }

  // Function to call the date picker
  Future<void> _selectDate() async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? now,
        firstDate: DateTime(now.year - 100),
        lastDate: now,
        builder: (context, child) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              // width: 250,
              // height: 400,
              decoration: BoxDecoration(
                // image: DecorationImage(
                // image: AssetImage('lib/assets/images/bg_login2.png')),
                // color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: child,
            ),
          );
        });

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // Update the controller text to the selected date
        controller.text = DateFormat('dd/MM/yyyy').format(_selectedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.onPrimary,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
          ),
        ],
      ),
      alignment: Alignment.center,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
        child: TextFormField(
          controller: controller,
          style: const TextStyle(fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  child: Icon(
                    Icons.cake_outlined,
                    size: 28,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: 0.5,
                  color: Colors.grey,
                  margin: const EdgeInsets.only(right: 12),
                ),
              ],
            ),
            labelText: 'Birth Date',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            suffix: const ImageIcon(
              AssetImage('lib/assets/icons/calendar.webp'),
            ),
            suffixStyle: TextStyle(
              fontSize: 24,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          readOnly: true,
          onTap: _selectDate, // Open date picker when tapped
        ),
      ),
    );
  }
}
