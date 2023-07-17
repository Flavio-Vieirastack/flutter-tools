import 'package:flutter/material.dart';

extension Arguments on BuildContext {
  T getArgs<T>() {
    return ModalRoute.of(this)?.settings.arguments as T;
  }
  T? getArgsNullable<T>() {
    return ModalRoute.of(this)?.settings.arguments as T?;
  }
}