import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tools/extensions/translate_extension.dart';
import 'package:flutter_tools/widgets/default_time_picker_params.dart';

import 'cupertino_default_time_picker_params.dart';

typedef AndroidTimePickerReturn = Future<TimeOfDay?>;
typedef CupertinoTimePickerReturn = Widget;

sealed class DefaultTimeAndDatePicker {
  static Future<dynamic> _cupertinoDatePickerDialog(
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

  static Future<DateTime?>? showDefaultTimePicker(
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
      if (defaultTimePickerParams.isAndroidDatePicker) {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(
              days: 720,
            ),
          ),
          cancelText: 'Cancelar'.translateTo('Cancel'),
          confirmText: 'Ok'.translateTo('Ok'),
        );
        return date;
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
          date?.hour ?? now.hour,
          date?.minute ?? now.minute,
        );
      }
    }

    return null;
  }
}
