import 'package:flutter/material.dart';

class ButtonFieldLogin extends StatelessWidget {
  const ButtonFieldLogin({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(380, 50),
        enableFeedback: false,
      ).copyWith(
          // overlayColor: WidgetStateProperty.all(
          //   const Color.fromARGB(204, 18, 38, 150),
          // ),
          ),
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}
