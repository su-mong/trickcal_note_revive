import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const BaseButton({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: child,
      ),
    );
  }
}