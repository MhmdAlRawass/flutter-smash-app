import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class NumberField extends StatelessWidget {
  const NumberField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
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
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Icon(
                Icons.phone_android_outlined,
                size: 28,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Container(
                width: 0.5,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: IntlPhoneField(
                languageCode: 'LB',

                decoration: InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  counterText: '',
                  isDense: true,
                  labelText: 'Cell',
                  labelStyle: TextStyle(
                    // fontSize: 14,

                    fontWeight: FontWeight.w500,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.7),
                  ),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                ),
                initialValue: '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  // fontSize: 14,
                ),
                dropdownIconPosition: IconPosition.trailing,
                flagsButtonPadding: const EdgeInsets.only(top: 12, right: 0),

                // showCountryFlag: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
