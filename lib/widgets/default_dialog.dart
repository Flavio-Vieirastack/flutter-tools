import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tools/extensions/stool_in_navigator_extensions.dart';
import 'package:flutter_tools/extensions/translate_extension.dart';

import 'default_dialog_params.dart';

class DefaultDialog extends StatelessWidget {
  final String title;
  final String titleTranslate;
  final String description;
  final String descriptionTransalate;
  final String cancelButtonText;
  final String cancelButtonTextTranslate;
  final String okButtonText;
  final String okButtonTextTranslate;
  final VoidCallback onOkButtonPressed;
  final bool isLoading;
  final DefaultDialogParams defaultDialogParams;
  const DefaultDialog({
    Key? key,
    required this.title,
    required this.titleTranslate,
    required this.description,
    required this.descriptionTransalate,
    required this.cancelButtonText,
    required this.cancelButtonTextTranslate,
    required this.okButtonText,
    required this.okButtonTextTranslate,
    required this.onOkButtonPressed,
    required this.defaultDialogParams,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: Text(
          title.translateTo(titleTranslate),
          style: defaultDialogParams.titleStyle,
        ),
        content: isLoading
            ? Padding(
                padding: EdgeInsets.only(top: defaultDialogParams.topPadding),
                child: const CircularProgressIndicator.adaptive(),
              )
            : Text(
                description.translateTo(descriptionTransalate),
                style: defaultDialogParams.subTitleStyle,
              ),
        actions: <Widget>[
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              cancelButtonText.translateTo(
                cancelButtonTextTranslate,
              ),
              style: defaultDialogParams.cancelButtonStyle,
            ),
          ),
          TextButton(
            onPressed: onOkButtonPressed,
            child: Text(
              okButtonText.translateTo(okButtonTextTranslate),
              style: defaultDialogParams.okButtonStyle
            ),
          ),
        ],
      );
    } else {
      return AlertDialog(
        title: Text(
          title.translateTo(titleTranslate),
          style: defaultDialogParams.titleStyle,
        ),
        content: isLoading
            ? const CircularProgressIndicator.adaptive()
            : Text(
                description.translateTo(descriptionTransalate),
                style: defaultDialogParams.subTitleStyle,
              ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            defaultDialogParams.borderRadius,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              cancelButtonText.translateTo(
                cancelButtonTextTranslate,
              ),
              style: defaultDialogParams.cancelButtonStyle
            ),
          ),
          TextButton(
            onPressed: onOkButtonPressed,
            child: Text(
              okButtonText.translateTo(okButtonTextTranslate),
              style: defaultDialogParams.okButtonStyle,
            ),
          ),
        ],
      );
    }
  }
}
