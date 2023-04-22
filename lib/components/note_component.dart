import 'package:flutter/material.dart';

class NoteUI extends StatelessWidget {
  const NoteUI(
      {super.key,
      required this.backgroundColor,
      required this.aboveColor,
      required this.child});
  final Color backgroundColor;
  final Color aboveColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: child,
    );
  }
}
