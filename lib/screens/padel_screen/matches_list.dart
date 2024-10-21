import 'package:flutter/material.dart';
import 'package:smash/widgets/padel/up_coming_matches.dart';
import 'package:smash/widgets/tabs/app_bar.dart';

class MatchesListScreen extends StatelessWidget {
  const MatchesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: TabsAppBar(
          page: 0,
          onPressedBackward: () {},
          onPressedDrawer: () {},
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'List of Bookings',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.all(8),
                    child: UpComingMatches(
                      isPadelScreen: false,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
