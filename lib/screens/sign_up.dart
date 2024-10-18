import 'package:flutter/material.dart';

import 'package:smash/widgets/sign_up/birth_input.dart';
import 'package:smash/widgets/sign_up/custom_snackbar.dart';
import 'package:smash/widgets/sign_up/gender_input.dart';
import 'package:smash/widgets/sign_up/input_fields.dart';
import 'package:smash/widgets/sign_up/phone_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Controllers initialized
  final TextEditingController _enteredFirstName = TextEditingController();
  final TextEditingController _enteredLastName = TextEditingController();
  final TextEditingController _enteredBirthDate = TextEditingController();
  final TextEditingController _enteredGender = TextEditingController();
  final TextEditingController _enteredPhoneNumber = TextEditingController();
  final TextEditingController _enteredEmail = TextEditingController();
  final TextEditingController _enteredPassword = TextEditingController();
  final TextEditingController _enteredConfirmPassword = TextEditingController();

  void _submitForm() {
    if (_enteredFirstName.text.isEmpty ||
        _enteredLastName.text.isEmpty ||
        _enteredBirthDate.text.isEmpty ||
        _enteredPhoneNumber.text.isEmpty ||
        _enteredGender.text.isEmpty ||
        _enteredEmail.text.isEmpty ||
        _enteredPassword.text.isEmpty ||
        _enteredConfirmPassword.text.isEmpty) {
      _showCustomSnackbar('Fields cannot be empty');
    } else if (_enteredPassword.text != _enteredConfirmPassword.text) {
      _showCustomSnackbar('Passwords doesn\'t match');
    } else if (!_enteredEmail.text.contains('@')) {
      _showCustomSnackbar('Please enter a valid email');
    } else {
      Navigator.of(context).pop(_enteredFirstName);
    }
  }

  void _showCustomSnackbar(String message) {
    final overlay = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top, // Shows at the top
        left: 0,
        right: 0,
        child: FadeInSnackbar(
          message: message,
          isError: true,
        ),
      ),
    );

    // Insert the snackbar into the overlay
    Overlay.of(context).insert(overlay);

    // Remove the snackbar after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      overlay.remove();
    });
  }

  @override
  void dispose() {
    _enteredFirstName.dispose();
    _enteredLastName.dispose();
    _enteredBirthDate.dispose();
    _enteredGender.dispose();
    _enteredPhoneNumber.dispose();
    _enteredEmail.dispose();
    _enteredPassword.dispose();
    _enteredConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(70),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'lib/assets/images/background.webp',
              fit: BoxFit.cover,
            ),
            AppBar(
              title: const Text('Personal Data'),
              backgroundColor: Colors.transparent,
              // shadowColor: const Color.fromARGB(255, 0, 0, 0),
              elevation: 6,
              automaticallyImplyLeading: true,

              centerTitle: true,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 12),
              InputFields(
                text: 'First Name',
                isPassword: false,
                controller: _enteredFirstName,
              ),
              const SizedBox(height: 8),
              InputFields(
                text: 'Last Name',
                isPassword: false,
                controller: _enteredLastName,
              ),
              const SizedBox(height: 8),
              BirthInput(
                controller: _enteredBirthDate,
              ),
              const SizedBox(height: 8),
              GenderInput(
                controller: _enteredGender,
              ),
              const SizedBox(height: 8),
              PhoneInput(
                controller: _enteredPhoneNumber,
              ),
              const SizedBox(height: 8),
              InputFields(
                text: 'Email',
                isPassword: false,
                controller: _enteredEmail,
              ),
              const SizedBox(height: 8),
              InputFields(
                text: 'Password',
                isPassword: true,
                controller: _enteredPassword,
              ),
              const SizedBox(height: 8),
              InputFields(
                text: 'Confirm Password',
                isPassword: true,
                controller: _enteredConfirmPassword,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            onPressed: _submitForm,
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ),
            style: IconButton.styleFrom(
              shape: const CircleBorder(side: BorderSide.none),
            ),
            iconSize: 30,
          ),
        ),
      ),
    );
  }
}
