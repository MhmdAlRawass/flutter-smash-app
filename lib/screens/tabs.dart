import 'package:flutter/gestures.dart';
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
  bool _openDrawer = false;
  bool _isSubPage = false;
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

    // Calculate bottom padding based on the height of the bottom navigation bar
    final bottomPadding =
        MediaQuery.of(context).padding.bottom + 60; // Height of bottom bar

    return Scaffold(
      extendBodyBehindAppBar: _bodyOverAppBar,
      drawerDragStartBehavior: DragStartBehavior.start,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: GestureDetector(
          onTap: () {
            setState(() {
              _openDrawer = false;
            });
          },
          child: TabsAppBar(
            page: _selectedPage,
            onPressedBackward: () {
              setState(() {
                _selectedPage = 0;
                _isSubPage = false;
              });
            },
            isSubPage: _isSubPage,
            onPressedDrawer: () {
              setState(() {
                _openDrawer = !_openDrawer;
              });
            },
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                bottom: bottomPadding), // Padding for bottom bar
            child: _screens[_selectedPage], // The selected page content
          ),

          // Bottom Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: 60, // Custom height of the bottom bar
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white, // Custom background color
                elevation: 0, // Remove shadow from BottomNavigationBar
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
                    icon: ImageIcon(
                      AssetImage('lib/assets/icons/user.webp'),
                    ),
                    label: 'User',
                  ),
                ],
              ),
            ),
          ),

          // Custom Drawer
          if (_openDrawer)
            GestureDetector(
              onTap: () {
                setState(() {
                  _openDrawer = false;
                });
              },
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),

          // Custom Animated Drawer
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: 0,
            left: _openDrawer
                ? 0
                : -MediaQuery.of(context).size.width / 1.5, // Slide in/out
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height, // Cover full height
              decoration: BoxDecoration(
                color: Colors.white, // Background color of drawer
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Drawer shadow
                    spreadRadius: 5,
                    blurRadius: 15,
                    offset: const Offset(3, 3),
                  ),
                ],
              ),
              child: DrawerTabs(
                onPressedBooking: () {
                  setState(() {
                    _openDrawer = false;
                    _selectedPage = 1;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
