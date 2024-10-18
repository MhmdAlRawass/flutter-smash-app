import 'package:flutter/material.dart';

class InputFieldUser extends StatelessWidget {
  const InputFieldUser({
    super.key,
    required this.text,
    required this.icon,
    required this.value,
  });

  final Icon icon;
  final String text;
  final String value;

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
          decoration: InputDecoration(
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  child: icon,
                ),
                Container(
                  height: double.infinity,
                  width: 0.5,
                  color: Colors.grey,
                  margin: const EdgeInsets.only(right: 12),
                ),
              ],
            ),
            labelText: text,
            disabledBorder: InputBorder.none,
            border: InputBorder.none,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          initialValue: value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
