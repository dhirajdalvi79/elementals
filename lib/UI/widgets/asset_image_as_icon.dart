import 'package:flutter/material.dart';

/// Sets the icons for main screen app bar.
class IconImage extends StatelessWidget {
  const IconImage({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: Image.asset(
        path,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
