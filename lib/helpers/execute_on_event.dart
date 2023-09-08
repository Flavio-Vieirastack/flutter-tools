import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tools/extensions/translate_extension.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../event_bus/events/auto_navigate_event.dart';
import '../event_bus/events/auto_pop_event.dart';
import '../event_bus/events/block_device_event.dart';
import '../event_bus/events/block_touch_event.dart';
import '../event_bus/events/no_internet_event.dart';
import '../event_bus/events/notifications_event.dart';
import '../event_bus/events/unlock_touch_event.dart';

class OnNoInternetEvent {
  static void execute(
    dynamic event,
    GlobalKey<NavigatorState> navigatorKey, {
    required Widget noInternetPage,
  }) {
    if (event is NoInternetEvent) {
      navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(
          builder: (context) => noInternetPage,
        ),
      );
    }
  }
}

class OnBlockDeviceEvent {
  static void execute(
    dynamic event,
    GlobalKey<NavigatorState> navigatorKey, {
    required Widget blockUserPage,
  }) {
    if (event is BlockDeviceEvent) {
      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => blockUserPage,
        ),
      );
    }
  }
}

class OnBlockTouchEvent {
  static bool lockAndUnlockTouch(dynamic event) {
    if (event is BlockTouchEvent) {
      return true;
    } else if (event is UnlockTouchEvent) {
      return false;
    }
    return false;
  }
}

class OnSnackbarEvent {
  static void execute(
    dynamic event,
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
    GlobalKey<NavigatorState> navigatorKey, {
    required bool autoTranslate,
  }) {
    if (autoTranslate) {
      if (event is SnackbarEvent) {
        if (event.isErrorMessage) {
          final navKey = navigatorKey;
          showTopSnackBar(
              navKey.currentState!.overlay!,
              Material(
                elevation: 0,
                color: Colors.transparent,
                child: AwesomeSnackbarContent(
                  title: 'Ops!'.translateTo('Ops!'),
                  message: event.message.translateTo(event.translate),
                  contentType: ContentType.failure,
                ),
              ),
              displayDuration: Duration(seconds: event.durationInSeconds));
        } else if (event.isInfoMessage) {
          final navKey = navigatorKey;
          showTopSnackBar(
              navKey.currentState!.overlay!,
              Material(
                elevation: 0,
                color: Colors.transparent,
                child: AwesomeSnackbarContent(
                  title: 'Atenção'.translateTo('Warning'),
                  color: Colors.orange,
                  message: event.message.translateTo(event.translate),
                  contentType: ContentType.warning,
                ),
              ),
              displayDuration: Duration(seconds: event.durationInSeconds));
        } else if (event.isSuccessMessage) {
          final navKey = navigatorKey;
          showTopSnackBar(
              navKey.currentState!.overlay!,
              Material(
                elevation: 0,
                color: Colors.transparent,
                child: AwesomeSnackbarContent(
                  title: 'Sucesso'.translateTo('Success'),
                  message: event.message.translateTo(event.translate),
                  contentType: ContentType.success,
                ),
              ),
              displayDuration: Duration(seconds: event.durationInSeconds));
        }
      }
    } else {
      if (event is SnackbarEvent) {
        if (event.isErrorMessage) {
          final navKey = navigatorKey;
          showTopSnackBar(
              navKey.currentState!.overlay!,
              Material(
                elevation: 0,
                color: Colors.transparent,
                child: AwesomeSnackbarContent(
                  title: 'Ops!',
                  message: event.message.translateTo(event.translate),
                  contentType: ContentType.failure,
                ),
              ),
              displayDuration: Duration(seconds: event.durationInSeconds));
        } else if (event.isInfoMessage) {
          final navKey = navigatorKey;
          showTopSnackBar(
              navKey.currentState!.overlay!,
              Material(
                elevation: 0,
                color: Colors.transparent,
                child: AwesomeSnackbarContent(
                  title: 'Atenção',
                  color: Colors.orange,
                  message: event.message.translateTo(event.translate),
                  contentType: ContentType.warning,
                ),
              ),
              displayDuration: Duration(seconds: event.durationInSeconds));
        } else if (event.isSuccessMessage) {
          final navKey = navigatorKey;
          showTopSnackBar(
              navKey.currentState!.overlay!,
              Material(
                elevation: 0,
                color: Colors.transparent,
                child: AwesomeSnackbarContent(
                  title: 'Sucesso',
                  message: event.message.translateTo(event.translate),
                  contentType: ContentType.success,
                ),
              ),
              displayDuration: Duration(seconds: event.durationInSeconds));
        }
      }
    }
  }
}

class OnAutoNavigateEvent {
  static void execute(dynamic event, GlobalKey<NavigatorState> navigatorKey) {
    if (event is AutoNavigateEvent) {
      if (event.replace) {
        navigatorKey.currentState?.pushReplacementNamed(
          event.route,
          arguments: event.args,
        );
      } else if (event.replace == false && event.removeUntil == false) {
        navigatorKey.currentState?.pushNamed(
          event.route,
          arguments: event.args,
        );
      } else if (event.removeUntil) {
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          event.route,
          (route) => false,
        );
      }
    }
  }
}

class OnAutoPopEvent {
  static void execute(dynamic event, GlobalKey<NavigatorState> navigatorKey) {
    if (event is AutoPopEvent && event.maybe == false) {
      navigatorKey.currentState?.pop();
    } else if (event is AutoPopEvent && event.maybe) {
      navigatorKey.currentState?.maybePop();
    }
  }
}
