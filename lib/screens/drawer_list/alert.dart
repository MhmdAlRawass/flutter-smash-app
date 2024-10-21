import 'package:flutter/material.dart';
import 'package:smash/widgets/tabs/app_bar.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: TabsAppBar(
          page: 0,
          onPressedBackward: () {},
          onPressedDrawer: () {},
          isSubPage: true,
        ),
      ),
      body: const Center(
        child: Text('Nothing here yet!'),
      ),
    );
  }
}
