import 'package:flutter/material.dart';

class TabsAppBar extends StatefulWidget {
  const TabsAppBar({
    super.key,
    required this.page,
    this.isSubPage = true,
    required this.onPressedBackward,
    required this.onPressedDrawer,
  });

  final int page;
  final bool isSubPage;
  final void Function() onPressedBackward;
  final void Function() onPressedDrawer;

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
    } else if (widget.page == 0 && !widget.isSubPage) {
      icon = IconButton(
        onPressed: () {
          widget.onPressedDrawer();
        },
        icon: const Icon(Icons.format_list_bulleted_rounded),
      );
    }
    if (widget.isSubPage && widget.page == 0) {
      icon = null;
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
