import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

import 'package:smash/screens/choose_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) {
              return const ChooseScreen();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Lottie.asset(
          'lib/assets/animations/padel-splash.json',
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
      
















  // AnimationController? _controller;
  // Animation<double>? _animation;

  // @override
  // void initState() {
  //   super.initState();

  //   // Initialize Controller
  //   _controller = AnimationController(
  //     duration: const Duration(seconds: 3),
  //     vsync: this,
  //   );

  //   // Initialize Animation Effect
  //   _animation = CurvedAnimation(
  //     parent: _controller!,
  //     curve: Curves.bounceOut,
  //   );

  //   //Start Animation
  //   _controller!.forward();

  //   // wait 3 seconds then navigate to the main screen
  //   Future.delayed(
  //     const Duration(seconds: 3),
  //     () {
  //       // ignore: use_build_context_synchronously
  //       Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(
  //           builder: (ctx) {
  //             return ChooseScreen();
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }

  // @override
  // void dispose() {
  //   _controller?.dispose();
  //   super.dispose();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Theme.of(context).colorScheme.primary,
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           ScaleTransition(
  //             scale: _animation!,
  //             child: Image.asset(
  //               'lib/assets/images/logo.png',
  //               width: 200,
  //               height: 200,
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 16,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );