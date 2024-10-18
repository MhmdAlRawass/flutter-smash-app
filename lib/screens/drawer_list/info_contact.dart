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
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(12),
          child: const Column(
            children: [
              Info(),
              SizedBox(
                height: 12,
              ),
              Location(),
            ],
          ),
        ),
      ),
    );
  }
}
