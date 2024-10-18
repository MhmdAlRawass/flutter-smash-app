import 'package:flutter/material.dart';

class TabsAppBar extends StatefulWidget {
  const TabsAppBar({
    super.key,
    required this.page,
    required this.onPressedBackward,
  });

  final int page;
  final void Function() onPressedBackward;

  @override
  State<TabsAppBar> createState() => _TabsAppBarState();
}

class _TabsAppBarState extends State<TabsAppBar> {
  @override
  Widget build(BuildContext context) {
    Widget? icon;
    bool removeBackgroundImage = widget.page == 1;

    if (widget.page > 0) {
      icon = IconButton(
        onPressed: widget.onPressedBackward,
        icon: const Icon(Icons.arrow_back),
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        if (!removeBackgroundImage)
          Image.asset(
            'lib/assets/images/background.webp',
            fit: BoxFit.cover,
          ),
        AppBar(
          leading: icon,
          iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.onPrimary,
            shadows: [
              BoxShadow(
                color: Theme.of(context).colorScheme.onPrimary,
                blurRadius: 2,
                spreadRadius: 2,
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Image.asset(
            'lib/assets/images/logo.webp',
            height: 110,
            fit: BoxFit.contain,
          ),
          centerTitle: true,
        ),
      ],
    );
  }
}
