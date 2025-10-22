import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  Future<T?> goPush<T>(Widget page) {
    return Navigator.push<T>(this, MaterialPageRoute(builder: (_) => page));
  }

  Future<T?> goPushReplacement<T>(Widget page) {
    return Navigator.pushReplacement<T, T>(
      this,
      MaterialPageRoute<T>(builder: (_) => page),
    );
  }

  Future<T?> goPushAndRemoveUntil<T>(Widget page) {
    return Navigator.pushAndRemoveUntil<T>(
      this,
      MaterialPageRoute<T>(builder: (_) => page),
      (route) => false,
    );
  }
}
