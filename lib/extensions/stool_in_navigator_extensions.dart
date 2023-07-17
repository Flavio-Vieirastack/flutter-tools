import 'package:flutter/material.dart';

extension StoolInNavigator on BuildContext {
  goTo({required String path, Object? args}) {
    Navigator.of(this).pushNamed(path, arguments: args);
  }

  goToAndReplace({required String path, Object? args}) {
    Navigator.of(this).pushReplacementNamed(path, arguments: args);
  }

  goToAndRemoveUntil({required String path, Object? args}) {
    Navigator.of(this).pushNamedAndRemoveUntil(
      path,
      arguments: args,
      (path) => false,
    );
  }

  pop({Object? args}) {
    Navigator.pop(this, args);
  }

  maybePop() {
    Navigator.of(this).maybePop();
  }
}
