import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage('lib/assets/images/background.webp'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 64,
              right: 64,
              bottom: 90,
              // top: 70,
            ),
            child:
                // Container(
                //   // padding: EdgeInsets.all(value),
                //   width: double.infinity,
                //   height: 240,
                //   child: Text(
                //     'SPLASH',
                //     style: TextStyle(
                //       color: Theme.of(context).colorScheme.primary,
                //       fontSize: 38,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // )
                Image.asset(
              'lib/assets/images/logo.webp',
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 18,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width - 24,
              height: 120,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    ' PADEL SMASH',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 28,
                        color: Colors.purple,
                      ),
                      Text(
                        'Saida, Facing Turkish Republic Hospital',
                        style: TextStyle(
                            color: Color.fromARGB(255, 113, 113, 113)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Column(
              children: [
                IconButton.filledTonal(
                  onPressed: () {},
                  icon: const Icon(Icons.navigation_outlined),
                  constraints: const BoxConstraints(
                    minHeight: 32,
                    minWidth: 32,
                  ),
                  iconSize: 18,
                ),
                const SizedBox(
                  height: 4,
                ),
                IconButton.filledTonal(
                  onPressed: () {},
                  icon: const Icon(Icons.call),
                  constraints: const BoxConstraints(
                    minHeight: 32,
                    minWidth: 32,
                  ),
                  iconSize: 18,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
