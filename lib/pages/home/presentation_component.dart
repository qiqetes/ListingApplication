import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Presentation extends StatefulWidget {
  const Presentation({super.key});

  @override
  State<Presentation> createState() => PresentationState();
}

class PresentationState extends State<Presentation>
    with TickerProviderStateMixin {
  final _emojis = [
    "Movies",
    "Music",
    "Books",
    "Games",
    "Series",
    "Buildings",
    "Whatever"
  ];
  final _colors = [
    const Color(0xFF72B8FD),
    const Color(0xFFCEEF84),
    const Color(0xFFFB7086),
    const Color(0xFFFEDEBF),
  ];
  final Duration interval = const Duration(seconds: 5);
  final Duration animationDuration = const Duration(milliseconds: 2000);
  int _index = 0;
  int _indexColor = 0;

  late final AnimationController _controllerY;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controllerY = AnimationController(
      vsync: this,
      duration: animationDuration,
    );

    _rotationAnimation = CurvedAnimation(
      parent: _controllerY,
      curve: HalfCurve(),
    );

    Timer.periodic(interval, (_) => resetAnimation());
  }

  @override
  void dispose() {
    _controllerY.dispose();
    super.dispose();
  }

  void resetAnimation() {
    _controllerY.reset();
    _controllerY.forward();
    Future.delayed(
      Duration(milliseconds: animationDuration.inMilliseconds ~/ 2),
    ).then((_) {
      setState(() {
        _index = (_index + 1) % _emojis.length;
        _indexColor = (_indexColor + 1) % _colors.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 2),
          color: Colors.black),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _rotationAnimation,
            builder: (_, __) => Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateY(_rotationAnimation.value > 0.5
                    ? _rotationAnimation.value * pi
                    : pi * (1 - _rotationAnimation.value))
                ..scale(-1.0, 1.0, 1.0),
              child: AnimatedContainer(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: _colors[_indexColor],
                    borderRadius: BorderRadius.circular(75),
                  ),
                  child: Text(
                    _emojis[_index],
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  )),
            ),
          ),
          const SizedBox(height: 20),
          const SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(
                "Ask me about any listing you can think of:",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HalfCurve extends Curve {
  @override
  double transform(double t) {
    return 3 * t * t - 2 * t * t * t;
  }
}
