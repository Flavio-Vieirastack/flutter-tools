import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract mixin class ZoomDialog {
  Future<void> showZoomDialog(
    BuildContext context, {
    String? urlImage,
    File? fileImage,
    Uint8List? base64Image,
    final double? minScale,
    final double? maxScale,
    final double? height,
    final double? width,
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
      image = Image.memory(
        base64Image,
        fit: BoxFit.cover,
      );
    }
    return showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: padding),
          child: SizedBox(
            height: height,
            width: width,
            child: InteractiveViewer(
              constrained: true,
              minScale: minScale ?? 0.5,
              maxScale: maxScale ?? 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: image,
              ),
            ),
          ),
        );
      },
    );
  }
}
