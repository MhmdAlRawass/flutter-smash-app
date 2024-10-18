import 'package:flutter/material.dart';

class InputFieldLogin extends StatelessWidget {
  const InputFieldLogin({
    super.key,
    required this.title,
    required this.icon,
    required this.controller,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String title;
  final Icon icon;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        color: Colors.black,
      ),
      enableSuggestions: false,
      autocorrect: false,
      obscureText: isPassword ? true : false,
      keyboardType: isPassword
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromRGBO(255, 255, 255, 0.902).withOpacity(0.6),
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                top: 10,
                bottom: 10,
                right: 4,
              ),
              child: icon,
            ),
            Container(
              height: 18,
              width: 2,
              color: Colors.black,
            ),
            const SizedBox(width: 8),
          ],
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 0,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(36)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36),
            borderSide: BorderSide.none),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        hintText: title,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        prefixIconColor: Colors.black,
      ),
    );
  }
}
