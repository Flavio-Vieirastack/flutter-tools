import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tools/extensions/translate_extension.dart';
import 'package:flutter_tools/widgets/default_time_picker_params.dart';

import 'cupertino_default_time_picker_params.dart';

typedef AndroidTimePickerReturn = Future<TimeOfDay?>;
typedef CupertinoTimePickerReturn = Widget;

abstract mixin class DefaultTimeAndDatePicker {
  Future<dynamic> _cupertinoDatePickerDialog(
    BuildContext context, {
    required DefaultTimePickerParams defaultTimePickerParams,
    required CupertinoDefaultTimePickerParams cupertinoDefaultTimePickerParams,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () {
            cupertinoDefaultTimePickerParams.onPopDialog.call();
            return Future.value(true);
          },
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.symmetric(
              horizontal: defaultTimePickerParams.contentPadding,
            ),
            content: SizedBox(
              height: defaultTimePickerParams.sizedBoxHeight,
              width: defaultTimePickerParams.sizedBoxWidth,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  defaultTimePickerParams.borderRadius,
                ),
                child: CupertinoDatePicker(
                  maximumDate: DateTime.now().add(
                    const Duration(
                      days: 365,
                    ),
                  ),
                  backgroundColor: Colors.white.withOpacity(0.9),
                  onDateTimeChanged:
                      cupertinoDefaultTimePickerParams.onDateTimeChanged,
                  initialDateTime:
                      cupertinoDefaultTimePickerParams.cupertinoInitialTime,
                  mode:
                      cupertinoDefaultTimePickerParams.cupertinoDatePickerMode,
                  use24hFormat: true,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<DateTime?>? showDefaultTimePicker(
    BuildContext context, {
    required TimeOfDay initialTime,
    required DefaultTimePickerParams defaultTimePickerParams,
    required CupertinoDefaultTimePickerParams cupertinoDefaultTimePickerParams,
  }) async {
    if (Platform.isIOS) {
      _cupertinoDatePickerDialog(
        context,
        defaultTimePickerParams: defaultTimePickerParams,
        cupertinoDefaultTimePickerParams: cupertinoDefaultTimePickerParams,
      );
    } else {
      final date = await showTimePicker(
          context: context,
          initialTime: initialTime,
          cancelText: 'Cancelar'.translateTo('Cancel'),
          confirmText: 'Ok'.translateTo('Ok'));
      final now = DateTime.now();
      return DateTime(
        now.year,
        now.month,
        now.day,
        date?.hour ?? 0,
        date?.minute ?? 0,
      );
    }
    return null;
  }
}
