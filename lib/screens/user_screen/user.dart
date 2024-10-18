import 'package:flutter/material.dart';

import 'package:smash/widgets/user/birth_field.dart';
import 'package:smash/widgets/user/gender_field.dart';
import 'package:smash/widgets/user/input_fields.dart';
import 'package:smash/widgets/user/number_field.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            // direction: Axis.vertical,
            children: [
              InputFieldUser(
                text: 'Name',
                value: 'Name...',
                icon: Icon(
                  Icons.account_circle_outlined,
                  size: 28,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              InputFieldUser(
                text: 'Last Name',
                value: 'Last...',
                icon: Icon(
                  Icons.supervised_user_circle_outlined,
                  size: 28,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const GenderFieldUser(),
              const SizedBox(
                height: 12,
              ),
              const BirthFieldUser(),
              const SizedBox(
                height: 12,
              ),
              const NumberField(),
              const SizedBox(
                height: 12,
              ),
              InputFieldUser(
                text: 'E-mail',
                icon: Icon(
                  Icons.email_outlined,
                  size: 28,
                  color: Theme.of(context).colorScheme.primary,
                ),
                value: 'tester@test.com',
              )
            ],
          ),
        ),
      ),
    );
  }
}
