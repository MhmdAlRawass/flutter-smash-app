import 'package:flutter/material.dart';
import 'package:smash/screens/drawer_list/alert.dart';
import 'package:smash/screens/drawer_list/info_contact.dart';

class DrawerTabs extends StatefulWidget {
  const DrawerTabs({
    super.key,
    required this.onPressedBooking,
  });

  final void Function() onPressedBooking;

  @override
  State<DrawerTabs> createState() => _DrawerTabsState();
}

class _DrawerTabsState extends State<DrawerTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer Header with profile information
          const DrawerHeader(
            decoration: BoxDecoration(
              // color: Theme.of(context).colorScheme.primary,
              image: DecorationImage(
                image: AssetImage('lib/assets/images/background.webp'),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Name ...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Email ...',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Modern list items
          _buildDrawerItem(
            context,
            icon: Icons.add_alert_outlined,
            text: 'Alert',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return const AlertScreen();
                  },
                ),
              );
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.newspaper,
            text: 'News',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return const AlertScreen();
                  },
                ),
              );
            },
          ),
          _buildDrawerItem(
            context,
            imageIcon: ImageIcon(
              const AssetImage(
                'lib/assets/icons/padel.webp',
              ),
              color: Theme.of(context).colorScheme.onSurface,
            ),
            text: 'Booking',
            onTap: () {
              widget.onPressedBooking();
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.info_outline,
            text: 'Info | Contact',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return const InfoContactScreen();
                  },
                ),
              );
            },
          ),
          const Divider(),
          _buildDrawerItem(
            context,
            icon: Icons.logout_outlined,
            text: 'Logout',
            onTap: () {},
            color: Colors.redAccent,
          ),
        ],
      ),
    );
  }

  // Drawer item with padding and customizable icon
  Widget _buildDrawerItem(
    BuildContext context, {
    IconData? icon,
    ImageIcon? imageIcon,
    required String text,
    required GestureTapCallback onTap,
    Color? color,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      leading: icon != null
          ? Icon(icon, color: color ?? Theme.of(context).colorScheme.onSurface)
          : imageIcon,
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: color ?? Theme.of(context).colorScheme.onSurface,
        ),
      ),
      onTap: onTap,
      hoverColor: Theme.of(context)
          .colorScheme
          .primary
          .withOpacity(0.1), // Hover effect for interaction
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
