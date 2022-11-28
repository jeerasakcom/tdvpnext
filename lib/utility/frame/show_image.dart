import 'package:flutter/material.dart';

class ShowImage extends StatelessWidget {
  final String? path;
  final double? width;
  const ShowImage({
    Key? key,
    this.path,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path ?? 'assets/images/avatar.png',
      width: width ?? 125,
    );
  }
}
