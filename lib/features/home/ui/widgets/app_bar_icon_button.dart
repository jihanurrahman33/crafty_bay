import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    super.key,
    required this.iconData,
    required this.onTap,
  });
  final VoidCallback onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: CircleAvatar(
        radius: 16,
        backgroundColor: Colors.grey.shade200,
        child: IconButton(
          onPressed: onTap,
          icon: Icon(iconData, color: Colors.grey, size: 18),
        ),
      ),
    );
  }
}
