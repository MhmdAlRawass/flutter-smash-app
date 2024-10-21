import 'package:flutter/material.dart';
import 'package:smash/widgets/info_contact/info.dart';
import 'package:smash/widgets/info_contact/location.dart';
import 'package:smash/widgets/tabs/app_bar.dart';

class InfoContactScreen extends StatefulWidget {
  const InfoContactScreen({super.key});

  @override
  State<InfoContactScreen> createState() => _InfoContactScreenState();
}

class _InfoContactScreenState extends State<InfoContactScreen> {
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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            children: [
              const Info(),
              const SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Location',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Location(),
            ],
          ),
        ),
      ),
    );
  }
}
