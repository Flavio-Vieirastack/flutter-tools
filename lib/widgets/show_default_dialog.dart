import 'package:flutter/material.dart';
import 'package:flutter_tools/widgets/default_dialog_params.dart';

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
  required DefaultDialogParams defaultDialogParams,
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
          defaultDialogParams: defaultDialogParams,
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
