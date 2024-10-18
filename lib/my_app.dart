import 'package:flutter/material.dart';


import 'package:smash/screens/splash.dart';

const kAppPrimaryColor =
    Color.fromARGB(255, 0, 184, 212); // Turquoise-Blue (Logo Color)

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // To make it fixed portrait
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Padel SMASH',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(0, 184, 212, 1),
          primary: const Color(0xFF0A3159),
          onPrimary: Colors.white,
        ),
        primarySwatch: Colors.teal,
        primaryColor: kAppPrimaryColor, // Setting primary color for the app
        appBarTheme: const AppBarTheme(
          color: kAppPrimaryColor, // Setting primary color to app bar
          iconTheme:
              IconThemeData(color: Colors.white), // White icons in the app bar
          titleTextStyle: TextStyle(
            color: Colors.white, // White text on app bar
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          toolbarHeight: 80, // Adjusting the height of the app bar
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.black),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}







// import 'package:flutter/material.dart';
// import 'package:padel_square_app/screens/choose_screen.dart';

// const kAppPrimaryColor = Color(0xFF00B8D4);

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {


//     return MaterialApp(
//       title: 'Padel SMASH',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: const Color(0xFF041AAA),
//           primary: const Color.fromARGB(255, 139, 139, 142),
//           // onPrimary: const Color.fromARGB(255, 7, 7, 7),
//         ),
//         primarySwatch: Colors.teal, // or your custom color
//         primaryColor: kAppPrimaryColor,
//         appBarTheme: const AppBarTheme(
//           color: kAppPrimaryColor, // Setting primary color to app bar
//           iconTheme: IconThemeData(color: Colors.black),
//         ),
//         textTheme: const TextTheme(
//           headlineLarge: TextStyle(color: Colors.white),
//           bodyLarge: TextStyle(color: Colors.black),
//         ),
//       ),
//       home: const Scaffold(
//         body: ChooseScreen(),
//       ),
//     );
//   }
// }