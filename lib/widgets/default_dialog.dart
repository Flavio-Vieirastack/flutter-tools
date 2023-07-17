import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tools/extensions/stool_in_navigator_extensions.dart';
import 'package:flutter_tools/extensions/translate_extension.dart';

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
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: Text(
          title.translateTo(titleTranslate),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: isLoading
            ? const Padding(
                padding: EdgeInsets.only(top: 10),
                child: CircularProgressIndicator.adaptive(),
              )
            : Text(
                description.translateTo(descriptionTransalate),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
        actions: <Widget>[
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              cancelButtonText.translateTo(
                cancelButtonTextTranslate,
              ),
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          TextButton(
            onPressed: onOkButtonPressed,
            child: Text(
              okButtonText.translateTo(okButtonTextTranslate),
              style: const TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      );
    } else {
      return AlertDialog(
        title: Text(
          title.translateTo(titleTranslate),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: isLoading
            ? const CircularProgressIndicator.adaptive()
            : Text(
                description.translateTo(descriptionTransalate),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              cancelButtonText.translateTo(
                cancelButtonTextTranslate,
              ),
              style: const TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          TextButton(
            onPressed: onOkButtonPressed,
            child: Text(
              okButtonText.translateTo(okButtonTextTranslate),
              style: const TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      );
    }
  }
}
