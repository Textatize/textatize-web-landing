import "package:flutter/material.dart";

class ShareTile extends StatelessWidget {
  final Icon icon;

  const ShareTile(this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        if (icon.icon == Icons.copy) {}
        if (icon.icon == Icons.download) {}
      },
      icon: icon,
    );
  }
}
