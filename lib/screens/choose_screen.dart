import 'package:flutter/material.dart';
import 'package:smash/screens/login.dart';
import 'package:smash/screens/tabs.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({super.key});

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  // Declare the _activeScreen as a nullable Widget
  Widget? _activeScreen;

  @override
  void initState() {
    super.initState();

    _activeScreen = LoginScreen(onPressedLogin: _changeScreen);
  }

  // Function to change screen
  void _changeScreen() {
    setState(() {
      _activeScreen = const TabsScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF041AAA),
        child: _activeScreen ??
            const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
      ),
    );
  }
}
