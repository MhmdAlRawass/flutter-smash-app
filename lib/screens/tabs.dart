import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:smash/screens/booking_screen/booking.dart';
import 'package:smash/screens/padel_screen/padel.dart';
import 'package:smash/screens/user_screen/user.dart';
import 'package:smash/widgets/drawer.dart';
import 'package:smash/widgets/tabs/app_bar.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPage = 0;

  bool _bodyOverAppBar = false;

  // Define the different screens (pages)
  final List<Widget> _screens = const [
    PadelScreen(),
    BookingScreen(),
    UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    if (_selectedPage == 1) {
      _bodyOverAppBar = true;
    } else {
      _bodyOverAppBar = false;
    }
    return Scaffold(
      extendBodyBehindAppBar: _bodyOverAppBar,

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: TabsAppBar(
          page: _selectedPage,
          onPressedBackward: () {
            setState(() {
              _selectedPage = 0;
            });
          },
        ),
      ),

      drawer: DrawerTabs(
        onPressedBooking: () {
          setState(() {
            _selectedPage = 1;
          });
        },
      ),
      body: _screens[
          _selectedPage], // Use the correct screen based on _selectedPage
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: BottomNavigationBar(
          enableFeedback: false,
          currentIndex: _selectedPage,
          onTap: (value) {
            setState(() {
              _selectedPage = value;
            });
          },
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('lib/assets/icons/padel.webp'),
              ),
              label: 'Padel',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('lib/assets/icons/tennis-court.webp'),
              ),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.user),
              label: 'User',
            ),
          ],
        ),
      ),
    );
  }
}
