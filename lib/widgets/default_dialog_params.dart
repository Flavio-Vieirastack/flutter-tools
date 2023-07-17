import 'package:flutter/material.dart';

class DefaultDialogParams {
  final double topPadding;
  final TextStyle? titleStyle;
  final TextStyle subTitleStyle;
  final TextStyle cancelButtonStyle;
  final TextStyle okButtonStyle;
  final double borderRadius;
  DefaultDialogParams({
    required this.topPadding,
    this.titleStyle,
    required this.subTitleStyle,
    required this.cancelButtonStyle,
    required this.okButtonStyle,
    required this.borderRadius,
  });
}
