import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  T responsive<T>(
    T defaultVal, {
    T? tablet,
    T? desktop,
  }) {
    final wd = MediaQuery.of(this).size.width;
    return wd >= 1152
        ? (desktop ?? tablet ?? defaultVal)
        : wd >= 704
        ? (tablet ?? defaultVal)
        : defaultVal;
  }
}