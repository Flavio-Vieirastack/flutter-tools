import 'dart:io';

import 'package:flutter/foundation.dart';

extension TranslateExtension on String {
  String _translation(String translation) {
    final location = Platform.localeName;
    if (location != 'pt_BR') {
      return translation;
    } else {
      return this;
    }
  }

  String translateTo(String translation) {
    if (kDebugMode) {
      return this;
    } else {
      return _translation(translation);
    }
  }
}
