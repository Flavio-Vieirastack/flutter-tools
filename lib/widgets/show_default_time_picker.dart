import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tools/widgets/default_time_picker_params.dart';
import 'package:flutter_tools/widgets/stool_in_default_time_picker.dart';

import 'cupertino_default_time_picker_params.dart';

class ShowDefaultTimePicker with DefaultTimeAndDatePicker {
  Future<void> showDefaultTimeAndDatePicker(
    BuildContext context, {
    required CupertinoDefaultTimePickerParams cupertinoDefaultTimePickerParams,
    required DefaultTimePickerParams defaultTimePickerParams,
    required ValueChanged<DateTime> onAndroidTimePicked,
  }) async {
    if (Platform.isAndroid) {
      final androidTimePicked = await showDefaultTimePicker(
        context,
        initialTime: TimeOfDay.now(),
        cupertinoDefaultTimePickerParams: cupertinoDefaultTimePickerParams,
        defaultTimePickerParams: defaultTimePickerParams,
      );
      if (androidTimePicked == null) return;
      onAndroidTimePicked.call(androidTimePicked);
    } else if (Platform.isIOS) {
      await showDefaultTimePicker(
        context,
        initialTime: TimeOfDay.now(),
        cupertinoDefaultTimePickerParams: cupertinoDefaultTimePickerParams,
        defaultTimePickerParams: defaultTimePickerParams,
      );
    }
  }
}
