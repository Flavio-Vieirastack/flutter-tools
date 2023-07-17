import 'package:flutter/material.dart';
import 'package:flutter_tools/extensions/stool_in_navigator_extensions.dart';

abstract mixin class CustomToolTip {
  Future<dynamic> showToolTip(
    BuildContext context, {
    int? secondsToPopToolTip,
    bool barrierDismissible = false,
    required String message,
    required double borderRadius,
    required TextStyle toolTipStyle,
  }) {
    Future<void> popDialog() async {
      await Future.delayed(
        Duration(seconds: secondsToPopToolTip ?? 2),
        () => context.pop(),
      );
    }

    if (secondsToPopToolTip != null) {
      popDialog();
    }
    return showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius,
              ),
            ),
          ),
          backgroundColor: Colors.black.withOpacity(0.7),
          title: Center(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: toolTipStyle,
            ),
          ),
        );
      },
    );
  }
}
