import 'package:flutter/material.dart';

import 'default_dialog.dart';

Future<void> showDefaultDialog(
  BuildContext context, {
  Color? shadowColor,
  double? elevation,
  Color? backgroundColor,
  required String title,
  required String titleTranslate,
  required String description,
  required String descriptionTransalate,
  required String cancelButtonText,
  required String cancelButtonTextTranslate,
  required String okButtonText,
  required String okButtonTextTranslate,
  required VoidCallback onOkButtonPressed,
  bool isLoading = false,
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shadowColor: shadowColor ?? Colors.transparent,
        elevation: elevation ?? 0,
        backgroundColor: backgroundColor ?? Colors.transparent,
        child: DefaultDialog(
          title: title,
          titleTranslate: titleTranslate,
          description: description,
          descriptionTransalate: descriptionTransalate,
          cancelButtonText: cancelButtonText,
          cancelButtonTextTranslate: cancelButtonTextTranslate,
          okButtonText: okButtonText,
          okButtonTextTranslate: okButtonTextTranslate,
          onOkButtonPressed: onOkButtonPressed,
        ),
      );
    },
  );
}
