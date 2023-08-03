import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract mixin class ZoomDialog {
  Future<void> showZoomDialog(
    BuildContext context, {
    String? urlImage,
    File? fileImage,
    Uint8List? base64Image,
    required double padding,
    required double borderRadius,
  }) {
    Widget? image;
    if (urlImage != null) {
      image = Image.network(
        urlImage,
        fit: BoxFit.cover,
      );
    } else if (fileImage != null) {
      image = Image.file(
        fileImage,
        fit: BoxFit.cover,
      );
    } else if (base64Image != null) {
      image = Image.memory(base64Image);
    }
    return showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: padding),
          child: InteractiveViewer(
            constrained: true,
            minScale: 0.5,
            maxScale: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: image,
            ),
          ),
        );
      },
    );
  }
}
