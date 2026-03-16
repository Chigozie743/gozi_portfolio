import 'package:flutter/material.dart';

class AnimatedReveal extends StatelessWidget {
  const AnimatedReveal({
    super.key,
    required this.show,
    required this.delayMs,
    required this.child,
  });

  final bool show;
  final int delayMs;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: show ? 1 : 0),
      duration: Duration(milliseconds: 550 + delayMs),
      curve: Curves.easeOutCubic,
      builder: (context, value, currentChild) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, (1 - value) * 16),
            child: currentChild,
          ),
        );
      },
      child: child,
    );
  }
}
