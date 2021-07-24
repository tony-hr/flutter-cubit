import 'package:flutter/material.dart';

class Colors {
  const Colors();

  static const body = Color(0xFFffffff);
  static const body2 = Color(0xFFfafafa);
  static const primary = Color(0xFF21094E);
  static const second = Color(0xFF511281);
  static const third = Color(0xFF4CA1A3);
  static const dark = Color(0xFF0c3507);
  static const lightGrey = Color(0xFFf3f3f4);
  static const baseColorShimmer = Color(0xFFf6f8fa);
  static const highlightColorShimmer = Color(0xFFc9d3d3);
  static const border = Color(0xFFdbdadf);
  static const font1 = Color(0xFF000000);
  static const font2 = Color(0xFF929292);
  static const font3 = Color(0xFF606060);
  static const font4 = Color(0xFFd4d4d4);
  static const fontError = Color(0xFFFF0000);

  static const LinearGradient gradientLeftRight = LinearGradient(
    colors: const [primary, second],
    stops: const [0.0, 0.7],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient gradientRightLeft = LinearGradient(
    colors: const [primary, second],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
  );

  static const LinearGradient gradientTopBottom = LinearGradient(
    colors: const [primary, second],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter
  );

  static const LinearGradient gradientBottomTop = LinearGradient(
    colors: const [primary, second],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter
  );

  static const LinearGradient gradientTopBottomAppbar = LinearGradient(
    colors: const [primary, Colors.body],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.1, 0.8]
  );
}
