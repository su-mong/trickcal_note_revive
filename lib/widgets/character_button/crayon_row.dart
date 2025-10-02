import 'package:flutter/material.dart';

class CrayonRow extends StatelessWidget {
  static const double _height = 16;
  static const double _gap = 7;

  final int gold;
  final int purple;

  const CrayonRow({
    super.key,
    required this.gold,
    required this.purple,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: Stack(
        children: [
          ...List.generate(
            purple,
            (index) => Positioned(
              left: (purple - 1 - index + gold) * _gap,
              child: Image.asset(
                'assets/images/purple_crayon.png',
                height: _height,
              ),
            ),
          ),
          ...List.generate(
            gold,
            (index) => Positioned(
              left: (gold - 1 - index) * _gap,
              child: Image.asset(
                'assets/images/gold_crayon.png',
                height: _height,
              ),
            ),
          ),
        ],
      ),
    );
  }
}