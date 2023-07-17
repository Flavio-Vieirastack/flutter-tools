import 'package:flutter/cupertino.dart';

class CupertinoDefaultTimePickerParams {
  final DateTime cupertinoInitialTime;
  final void Function(DateTime date) onDateTimeChanged;
  final CupertinoDatePickerMode cupertinoDatePickerMode;
  final VoidCallback onPopDialog;
  CupertinoDefaultTimePickerParams({
    required this.cupertinoInitialTime,
    required this.onDateTimeChanged,
    required this.onPopDialog,
    this.cupertinoDatePickerMode = CupertinoDatePickerMode.time,
  });

  CupertinoDefaultTimePickerParams copyWith({
    DateTime? cupertinoInitialTime,
    void Function(DateTime date)? onDateTimeChanged,
    CupertinoDatePickerMode? cupertinoDatePickerMode,
  }) {
    return CupertinoDefaultTimePickerParams(
      cupertinoInitialTime: cupertinoInitialTime ?? this.cupertinoInitialTime,
      onDateTimeChanged: onDateTimeChanged ?? this.onDateTimeChanged,
      cupertinoDatePickerMode:
          cupertinoDatePickerMode ?? this.cupertinoDatePickerMode,
      onPopDialog: onPopDialog,
    );
  }
}
