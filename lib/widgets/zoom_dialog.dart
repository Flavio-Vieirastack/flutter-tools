import 'dart:io';

import 'package:flutter/material.dart';

abstract mixin class ZoomDialog {
  Future<void> showZoomDialog(
    BuildContext context, {
    String? urlImage,
    File? fileImage,
    required double padding,
    required double borderRadius,
  }) {
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
              child: urlImage != null
                  ? Image.network(
                      urlImage,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      fileImage!,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        );
      },
    );
  }
}
